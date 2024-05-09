# Uses Bun's alpine image as the builder image
FROM oven/bun:alpine as build-env

# Set the working directory
WORKDIR /app

# Copy the app directories
COPY ./src ./src
COPY ./static ./static

# Copy the app files
COPY package*.json ./
COPY bun.lockb ./
COPY svelte.config.js ./
COPY vite.config.js ./

# Install the dependencies
RUN bun install

# Patch broken Brotli Compression call
COPY patched_compress.js ./node_modules/@sveltejs/kit/src/core/adapt/builder.js

# Build, and remove dependencies
RUN bun run build \
    && rm -rf node_modules

# Use the distroless image as the running image for light weight
FROM oven/bun:distroless
COPY --from=build-env /app/build /app
WORKDIR /app
COPY serve.js ./

# Run the app
EXPOSE 3000/tcp
ENTRYPOINT ["bun", "./serve.js"]

# Uses Bun's distroless image as the base image
FROM oven/bun:alpine

# Set the working directory
WORKDIR /app

# Copy the app directories
COPY ./src ./src
COPY ./static ./static

# Copy the app files
COPY package.json ./
COPY bun.lockb ./
COPY svelte.config.js ./
COPY vite.config.js ./

# Install the dependencies, build, and remove dependencies
RUN bun install \
    && bun install -g serve \
    && bun run build \
    && rm -rf node_modules

# Expose the port served
EXPOSE 3000

# Start web server
CMD ["serve", "-s", "build"]

# welcome-to-docker

This is a Svelte/Bun SSG-only version of the Docker tutorial image, written from scratch. It uses Bun's HTTP server the serve the static files, and the Dockerfile is based on a distroless image.

## Usage

To use this image, simply clone with `git clone` and build with `docker build`:
```bash
git clone https://github.com/uptudev/welcome-to-docker.git
cd welcome-to-docker
docker build -t welcome-to-docker .
```
Then run the image with `docker run` or `docker compose up`:
```bash
docker run -d -p 3000:3000 welcome-to-docker
# or
docker compose up
```

Then, navigate to `http://localhost:3000` in your browser to see the Svelte app running.

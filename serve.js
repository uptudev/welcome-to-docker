Bun.serve({
    fetch(req) {
        return new Response(Bun.file("./index.html"));
    },
    port: 3000,
});

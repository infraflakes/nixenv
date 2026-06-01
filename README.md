### Personal env flakes for podman/docker setup.

Build the image:
```bash
podman build -t nixdev https://github.com/infraflakes/nixenv/raw/main/Dockerfile
```

Create the container:
```bash
podman run -it --network host --name nixdev nixdev
```

Reattach to the stopped container:
```bash
podman start -ai nixdev
```

Access the running container:
```bash
podman exec -it nixdev /usr/bin/fish
```

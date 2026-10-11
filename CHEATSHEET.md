# Docker cheat sheet

## Images
| Command | What it does |
|---|---|
| `docker pull python:3.13-slim` | download an image |
| `docker build -t taximetro .` | build an image from a Dockerfile |
| `docker images` | list images |
| `docker rmi taximetro` | remove an image |

## Containers
| Command | What it does |
|---|---|
| `docker run -d --name taxi -p 8000:8000 taximetro` | create and start a container (`-d` background, `-p host:container`) |
| `docker ps` / `docker ps -a` | running containers / all containers |
| `docker logs taxi` | show a container's output |
| `docker exec -it taxi sh` | open a shell inside a container |
| `docker stop taxi` / `docker rm taxi` | stop / remove (`rm -f` forces) |

## Volumes
| Command | What it does |
|---|---|
| `docker volume create taxi-data` | create a volume |
| `docker run -v taxi-data:/data ...` | mount it in a container |
| `docker volume ls` / `docker volume inspect taxi-data` | list / see details |
| `docker volume rm taxi-data` | remove it (the data is lost) |

## Mount types
| Type | Example | Use it for |
|---|---|---|
| Named volume | `-v taxi-data:/data` | data that must survive (databases) |
| Bind mount | `-v ./app:/app` | development: see code changes instantly |
| tmpfs | `--tmpfs /tmp` | temporary data, gone when the container stops |

## Dockerfile instructions
`FROM` base image · `WORKDIR` working directory · `COPY` copy files · `RUN` run at **build** time · `ENV` environment variable · `EXPOSE` document a port · `CMD` run at **start** time.

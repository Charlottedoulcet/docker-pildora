# 🐳 Docker pill: containers, images and volumes

Material for a bootcamp "pill" (talk + live demo) about Docker. The demo containerizes a real project, a **digital taximeter** (FastAPI + React + SQLite), with **one image, one container and one volume**.

## Branches

| Branch | What it is |
|---|---|
| `main` | The taximeter **with no Docker files**. This is the starting point of the live demo. |
| `solution` | The finished result: `Dockerfile`, `.dockerignore`, `CHEATSHEET.md` and `DEMO.md` (step-by-step script, in Spanish). |

## Follow along

You only need [Docker](https://docs.docker.com/get-started/get-docker/) installed (no Python or Node needed).

```bash
git clone <this-repo-url> && cd docker-pildora
git checkout solution            # or stay on main and write the files with me
docker build -t taximetro .
docker run -d --name taxi -p 8000:8000 -v taxi-data:/data taximetro
```

Open http://localhost:8000, register a company, do a ride, then:

```bash
docker rm -f taxi
docker run -d --name taxi -p 8000:8000 -v taxi-data:/data taximetro
```

Log in again: **your history is still there**, because the data lives in the `taxi-data` volume, not in the container. Run it again without `-v taxi-data:/data` and everything is gone.

## What you will learn

- **Image**: a read-only template built in layers from a `Dockerfile`.
- **Container**: a running image. What it writes inside is lost when you remove it.
- **Volume**: storage that outlives the container (named volume, bind mount, tmpfs).
- A **multi-stage build**: Node compiles the front, and the final image does not ship Node.

## About the project

The taximeter itself is documented in [README-taximetro.md](README-taximetro.md). Its original README mentions a planned `docker-compose` setup: that is **not** covered here (Compose and microservices are the topic of the next pill).

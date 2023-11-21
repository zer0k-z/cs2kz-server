# CS2 Server Template

## Running the container

Everything in the repository root will be copied into the container, so you can put plugins,
configuration files, etc. in the repo root and then install them in the container.

```sh
# Spin up container
$ docker compose up --build -d

# Figure out its ID
$ docker ps

# Shell into it
$ docker exec -it <ID> /bin/bash
```

## Installing the game server (in the container)

```sh
# Download CS2
$ make

# Run the server
$ make run
```

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

# Download metamod
$ make metamod

# Run the server
$ make run
```

## Installing CS2KZ

1. Follow the instructions in this repo: https://github.com/zer0k-z/cs2kz_metamod/tree/dev
2. Copy `build/package` from the cs2kz_metamod repo into `./cs2kz`
3. Run `make kz` in the container

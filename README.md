# CS2KZ Linux Docker Development Server

## Running the container

To start the server, run the following command:

```sh
$ docker compose up --build
```

The server would spin forever so you can shell into it from a separate shell session.

`make plugin` recompiles the plugin and put it into the server's directory.
`make runkz` runs the server.
`make gameserver` updates the server, use when the game gets updated.

Everything in the repository root will be copied into the container, do not place
the server or the cs2kz-metamod repository inside this folder.
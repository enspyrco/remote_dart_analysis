# remote_dart_analysis

*The Dart analysis server in a Cloud Run instance via websockets.*

The Dockerfile builds an image from `dart:stable-sdk` meaning the image is larger and includes the Dart SDK.

The Docker image starts the Dart analysis server via `Process.start` and a websocket server using package:shelf.

[Project Notes](https://enspyrco.notion.site/remote_dart_analysis-e6905abb76484a3cbffdf6314b565cd6?pvs=4)

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```sh
$ dart run bin/server.dart
Server listening on port 8080
```

And then from a second terminal:

```sh
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```sh
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:

```sh
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

You should see the logging printed in the first terminal:

```sh
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```

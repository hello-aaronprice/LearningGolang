# LearningGolang

Repo for GoLang learning

## Docker

### Run Go in Docker

```
cd ./LearningGolang
./docker-build
./docker-run
go version
```

Launch project and files in a Docker container with the local directory mounted to the container

### Dockerfile

```
FROM golang:1.21.3 as dev
```

### Docker-Build

Builds the docker image using the Dockerfile (above) in the current working directory and tags the image with the name 'my-go:latest'

```
docker build . -t my-go
```

### Docker-Run

```
docker  run  -v $PWD:/go/app/  -w  /go/app  --network="host"  --rm  -it  my-go  bash
```

Runs the latest 'my-go' docker image

Mounts the current working directory into the /go/app folder on the container and sets the Working Directory there so we do to that location

Sets the networking to the HOST so there is no need to do any port forwarding at the moment

`--rm` and `-it` docker run standards. `rm` to keep local machine clean and `it` to enter CLI

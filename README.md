# LearningGolang

### Context

Repo for learning Golang following documentation from Alex Edwards book '[Let's Go](https://lets-go.alexedwards.net)'
I'm a DevOps engineer with the majority of my experience being in Ops, I'm trying to learn the Dev side of things to continue to level up in my career

## Project Goals

### Goals

Build "Enterprise" Web Application from stratch using Golang. The project should include the following

- Unit and E2E tests
- Secure and persistent authentication
- Database
- Setup Instructions and documentation
- Docker and configuration files for isolated development
- GitHub Action pipeline files for automated deployment
- Terraform IaC for hosting in GCP
- Metrics and Monitoring

## Docker

### Run Project in Docker

Setup project and run project in a local Docker container

```
git clone git@github.com:hello-aaronprice/LearningGolang.git .
cd ./LearningGolang
./docker-build
./docker-run
cd snippetbox && go run .
```

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

Runs the latest 'my-go' docker image
Mounts the current working directory into the /go/app folder on the container and sets the Working Directory there so we do to that location
Sets the networking to the HOST so there is no need to do any port forwarding at the moment
`--rm` and `-it` docker run standards. `rm` to keep local machine clean and `it` to enter CLI

```
docker run -v $PWD:/go/app/ -w /go/app --network="host" --rm -it my-go bash
```

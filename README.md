# Learning Golang

## Context

Repo for learning Golang following documentation from Alex Edwards book '[Let's Go](https://lets-go.alexedwards.net)'
I'm a DevOps engineer with the majority of my experience being in Ops, I'm trying to learn the Dev side of things to continue to level up in my career

## Project Goals

### Goals

Build "Enterprise" Web Application from scratch using Golang. The project should include the following

- [ ] Unit and E2E tests
- [ ] Secure and persistent authentication
- [x] Database
- [x] Setup Instructions and documentation
- [x] Docker and configuration files for isolated development
- [ ] GitHub Action pipeline files for automated deployment
- [ ] Terraform IaC for hosting in GCP
- [ ] Metrics and Monitoring
- [ ] HTMX Frontend

### Todo

- Multistage docker builds
- Start app without having to shell into it *minor*
- Find a better way to handle how the database passwords are handled instead of `sed -i`
- Finish all Goals listed above
- Finish Lets Go book and start Lets Go Further

## Running the Application

### Run Project Locally using Docker

### Prerequisites

The only 3 very basic requirements, which are `bash`, `docker` and `git`. These are required in order to run the containers and to clone the repo. All other requirements (Golang, Database) are taken care of and configured in the container 

---
### Setup

Setup project and run project in a local Docker containers using Docker Compose
First clone and navigate into copy of the local repo
Then run the command `./initialize-repo.sh` script file using your own root and user passwords for the database.
The script file takes 2 arguments and replaces them using `sed -i` in the appropriate file. It also uncomments a volume mount for the db to mount a sql file into the docker  `/docker-entrypoint-initdb.d` directory on first run.

```bash
git clone git@github.com:hello-aaronprice/LearningGolang.git .
cd ./LearningGolang
./initialize-repo.sh MyDBrootPassword MyDBuserPassword
```

### Start the web app

Currently to start the web app I have to shell into the `my-go` container and run `go run ./cmd/web`
I have a Todo task to resolve this

```bash
./docker-exec my-go
> go run ./cmd/web
```

### Stop the web app

```bash
docker compose down
```

### Docker Compose

As the application got more complex and a Database is required. I've added a docker compose file to create both the `my-go` and `my-db` containers with the required configuration setup on the same network whilst exposing the necessary ports to the host
The application can be started with

```bash

docker compose up -d
```

#### Connect to Container Instance

To shell into any of the containers running to troubleshoot run the following command in the `LearningGolang` directory. Which is also highlighted above in the 
```bash

./docker-exec {{container-name}}
```

## Remove Project Database

```
sudo chown -R ${USER} data/
rm -rfd data/
```

## Archive

#### Dockerfile

```bash
FROM golang:1.21.3
```

#### Docker-Build

Builds the docker image using the Dockerfile (above) in the current working directory and tags the image with the name 'my-go:latest'

```bash
docker build . -t my-go
```

#### Docker-Run

Runs the latest 'my-go' docker image
Mounts the current working directory into the /go/app folder on the container and sets the Working Directory there so we do to that location. Sets the networking to the HOST so there is no need to do any port forwarding at the moment `--rm` and `-it` docker run standards. `rm` to keep local machine clean and `it` to enter CLI

```bash
docker run -v $PWD:/go/app/ -w /go/app --network="host" --rm -it my-go bash
```
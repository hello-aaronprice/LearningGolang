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
- HTMX Frontend

### Todo

- Multistage docker builds
- Start app without having to shell into it *minor*
- Finish all Goals listed above
- Finish Lets Go book and start Lets Go Further

## Run the Application

### Run Project in Docker

Setup project and run project in a local Docker containers using Docker Compose
First clone and navigate into copy of the local repo
Secondly create a password text file that will be used by the docker compose file to create the root user password on the database. Then update the password in the SQL file to initialize the database

```
git clone git@github.com:hello-aaronprice/LearningGolang.git .
cd ./LearningGolang
./initialize-repo.sh MyDBrootPassword MyDBuserPassword
```
### Start the web app

Currently to star the web app I have to shell into the `my-go` container and run `go run ./cmd/web`
I have a Todo task to resolve this

```
./docker-exec my-go
> go run ./cmd/web
```


### Docker Compose

As the application got more complex and a Database is required. I've added a docker compose file to create both the `my-go` and `my-db` containers with the required configuration setup on the same network whilst exposing the necessary ports to the host
The application can be started with 

```
docker compose up -d
```

#### Connect to Container Instance

To shell into any of the containers running to troubleshoot run the following command in the `LearningGolang` directory

```
./docker-exec {{container-name}}
```
## Archive
### Dockerfile

```
FROM golang:1.21.3
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

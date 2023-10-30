# LearningGolang
Private Repo for GoLang learning excerises

## Docker
### Run Go in Docker
```
cd data/LearningGolang

docker build --target dev . -t go
docker run -it -v $(pwd):/go/src/work go 
go version
```
Launch project and files in a Docker container with the local directory mounted to the container.
### Dockerfile
```
FROM golang:1.21.3 as dev

WORKDIR /go/src/work

```
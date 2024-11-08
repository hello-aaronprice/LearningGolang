FROM golang:1.23.3

WORKDIR /app/snippetbox
COPY /snippetbox/go.mod ./

RUN go mod tidy && go mod verify && go mod download
COPY ./snippetbox/* ./

# RUN go build -o /snippetbox
# EXPOSE 4000

# CMD ["/snippetbox"]

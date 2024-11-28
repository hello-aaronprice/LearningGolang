FROM golang:1.23.3 AS dev

WORKDIR /app/snippetbox
COPY ./snippetbox/ /app/snippetbox/

RUN go mod tidy && go mod verify && go mod download

# RUN go build -o /snippetbox
# EXPOSE 4000

# CMD ["/snippetbox"]

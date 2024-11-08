FROM golang:1.23.3

WORKDIR /app/snippetbox
COPY /snippetbox/go.mod ./
RUN ls -la

RUN go mod download
COPY /snippetbox/* ./

RUN go build -o /snippetbox
EXPOSE 4000

CMD ["/snippetbox"]

#!/usr/bin/env bash

docker run -v $PWD:/go/app/ -w /go/app/snippetbox --network="host" --rm -it my-go bash

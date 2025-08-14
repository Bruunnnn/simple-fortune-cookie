FROM golang:latest

WORKDIR /app

COPY . .

RUN go build backend

CMD [ "go", "run", "backend" ]
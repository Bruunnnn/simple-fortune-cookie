FROM golang:latest

WORKDIR /app

COPY . .

RUN go build frontend

CMD [ "go", "run", "frontend" ]
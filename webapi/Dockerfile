FROM golang:1.21

WORKDIR /webapi

COPY . .

RUN go mod tidy

RUN go build -o main .

EXPOSE 8080

CMD ["./main"]
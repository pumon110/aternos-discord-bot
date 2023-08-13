FROM golang:1.18-alpine

WORKDIR /app

# expose available environment variables
ENV DISCORD_TOKEN="MTE0MDE2MjMzOTA5MDQ3NzA1Ng.GgBKSC.Iwszez6bXNveJ9WDujbITZQTSxsEs8KVoNlVx8"
ENV ATERNOS_SESSION="UVQd1yONWkzKJq0ELgkpQ86FdkIeOMXSUpz8xhBA6j0e8lyZk2CDadDjMuy5WzYCg85dLVqcf7RC0UnLtH6RUvMsukMcDiCTrx7k"
ENV ATERNOS_SERVER="MTE0MDE2MjMzOTA5MDQ3NzA1Ng.GgBKSC.Iwszez6bXNveJ9WDujbITZQTSxsEs8KVoNlVx8"
ENV MONGO_DB_URI=""
ENV PROXY=""

# install dependencies
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# copy files
COPY . ./

# build binary
RUN go build -o ./bin/aternos-discord-bot ./cmd/main.go

CMD [ "./bin/aternos-discord-bot" ]

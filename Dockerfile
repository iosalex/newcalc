

FROM swift:6.3-jammy
WORKDIR /app

COPY . .

RUN swift build -c release

EXPOSE 8080

CMD [".build/release/newcal", "serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]

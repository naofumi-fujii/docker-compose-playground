FROM rust:latest
WORKDIR /code
COPY . .
RUN cargo build --release
CMD ["cargo", "run"]

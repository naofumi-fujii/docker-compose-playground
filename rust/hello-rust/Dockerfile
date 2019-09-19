FROM rust:latest
WORKDIR /code
COPY . .
RUN cargo build --release
COPY . .
RUN cargo build
CMD ["cargo", "run"]

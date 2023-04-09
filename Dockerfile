FROM rust:1.68 as build

WORKDIR /usr/src/myact
COPY . .
RUN cargo install --path .
CMD ["/bin/sh"]

FROM gcr.io/distroless/cc-debian11

ARG ARCH=aarch64
COPY --from=build /usr/local/cargo/bin/myact /usr/local/bin/myact
COPY --from=build /usr/src/myact/.env /.env
EXPOSE 8080
CMD ["myact"]
FROM alpine
LABEL MAINTAINER="Scott Sanders <scott@koopaworks.com>"

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN set -eux; \
    && apk add --no-cache ca-certificates gcc \
    && wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-musl/rustup-init \
    && chmod +x rustup-init \
    && ./rustup-init -y --no-modify-path --default-toolchain nightly \
    && rm rustup-init \
    && chmod -R a+w $RUSTUP_HOME $CARGO_HOME \
    && rustup --version \
    && cargo --version \
    && rustc --version
    
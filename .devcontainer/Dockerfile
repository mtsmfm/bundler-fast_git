FROM ruby:2.7.1-buster

RUN apt update && apt install -y zsh less

RUN useradd --create-home --user-group --uid 1000 app
RUN mkdir -p /app /original
RUN chown -R app /app /original

WORKDIR /app

USER app

ENV SHELL=/bin/zsh

FROM erlang:27.0-alpine AS build

RUN apk add --no-cache elixir git
WORKDIR /app
COPY mix.exs mix.lock ./
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get

COPY . .

RUN mix compile
RUN mix release

FROM alpine:latest

RUN apk add --no-cache openssl
WORKDIR /app
COPY --from=build /app/_build/prod/rel/tally .

EXPOSE 4000

CMD ["bin/tally", "start"]

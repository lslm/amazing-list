FROM --platform=linux/amd64 ruby:3.1.2-alpine AS builder
RUN apk add build-base gcompat libpq-dev

COPY Gemfile* .

RUN bundle install

FROM --platform=linux/amd64 ruby:3.1.2-alpine AS runner

RUN apk add tzdata nodejs libpq-dev

WORKDIR /app

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

COPY . .

EXPOSE 3000
ENTRYPOINT ["./bin/prod"]

FROM ruby:2.6.5-alpine3.10

COPY ./hw1 ./app/hw1

WORKDIR ./app/hw1

ENTRYPOINT ["ruby","lib/main.rb"]

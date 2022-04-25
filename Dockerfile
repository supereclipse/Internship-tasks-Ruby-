FROM ruby:2.6.5-alpine3.10

ENV depth=3
ENV volumes_path='./hw1/data/csv_data/volumes.csv'
ENV vms_path='./hw1/data/csv_data/vms.csv'
ENV prices_path='./hw1/data/csv_data/prices.csv'

COPY . ./app/hw1

WORKDIR ./app/hw1

ENTRYPOINT ["ruby","main.rb"]

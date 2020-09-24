FROM ruby:2.4-alpine

LABEL Name=uniformcryptoassettradehistorycsvja Version=0.0.1

# For native deps compilation
RUN apk add --no-cache --update make alpine-sdk

RUN gem install activesupport -v 5.2.4.4
RUN gem install csvlint

WORKDIR /app

CMD ["csvlint"]
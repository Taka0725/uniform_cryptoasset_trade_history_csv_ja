docker build . -t csvlint
docker run --rm -it -v `pwd`:/data csvlint csvlint --schema /data/schema_leverage.json /data/leverage.csv

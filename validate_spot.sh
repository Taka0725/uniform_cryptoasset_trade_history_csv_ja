docker build . -t csvlint
docker run --rm -it -v `pwd`:/data csvlint csvlint --schema /data/schema_spot.json /data/spot.csv

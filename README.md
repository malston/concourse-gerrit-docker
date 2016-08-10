# Concourse Docker (with Gerrit)

### Quick-start with Docker Compose & Docker Machine

```sh
./generate-keys.sh
export CONCOURSE_LOGIN=concourse
export CONCOURSE_PASSWORD=changeme
export CONCOURSE_EXTERNAL_URL=http://192.168.99.100:8080
docker-machine create --driver virtualbox --virtualbox-memory "11000" --virtualbox-disk-size "100000" concourse-gerrit-docker
eval "$(docker-machine env concourse-gerrit-docker)"
docker-compose up -d
./setup-gerrit.sh
```

Then, browse to [http://192.168.99.100:8080](http://192.168.99.100:8080).

For further configuration, run `web --help` or `worker --help`.

See [Using Concourse](https://concourse.ci/using-concourse.html) to
get started.

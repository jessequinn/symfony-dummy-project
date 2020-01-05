ARG VERSION

FROM mysql:${VERSION} as prod

# Copy sql dump to initialize tables on stratup
COPY ./docker/mysql/init /docker-entrypoint-initdb.d

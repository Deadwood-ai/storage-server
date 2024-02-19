# storage-server
Docker compose file for storage-server-as-code.

The storage server exposes the storage-api in two different versions, the stable release at `/v1` and 
the development branch at `/dev`. Before the API is stable, both expose more or less the same functionality

## Live API

[https://data.deadtrees.earth/api/v1/](https://data.deadtrees.earth/api/v1/)

* [Swagger UI](https://data.deadtrees.earth/api/v1/docs)
* [Redoc](https://data.deadtrees.earth/api/v1/redoc)


# Development API

The latest API is hosted on a development branch. The uploaded data ends up in another location, which
is erased from time to time.

[https://data.deadtrees.earth/api/dev/](https://data.deadtrees.earth/api/dev/)

* [Swagger UI](https://data.deadtrees.earth/api/dev/docs)
* [Redoc](https://data.deadtrees.earth/api/dev/redoc)


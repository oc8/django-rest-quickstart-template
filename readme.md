# Django REST API Template

This is a Django project that can be easily extended to meet your needs. It uses Docker and PostgreSQL for easy development and deployment.

## Features

- Dockerized development and deployment
- PostgreSQL database
- Swagger documentation
- Unit tests
- Modular organization

## Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Installation

1. Clone this repository to your computer
2. Navigate to the project directory
3. Initialize the project with the command `./scripts/init_server.sh`
4. Start the server with the command `./scripts/run_server.sh`

## Organization

    .
    │── backend (main folder)
    │   │── models (database models)
    │   │── views (views for the API)
    │   │── serializers (serializers for the API)
    │   │── services (modular service functions)
    │   │── repositories (database queries)
    │   │── tests (unit tests)
    │   └── urls.py (API routes)
    └── scripts
        │── init_server.sh
        │── run_server.sh
        └── run_tests.sh


## Usage

### Redoc

The API is documented with Redoc. You can access the Redoc UI at `http://0.0.0.0:8000/redoc/`.

### Swagger

The API is documented with Swagger. You can access the Swagger UI at `http://0.0.0.0:8000/swagger/`.

### Unit tests

You can run the unit tests with the command `bash scripts/run_tests.sh`.
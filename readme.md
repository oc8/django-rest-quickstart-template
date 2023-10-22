# Django REST API Template

This is a Django project that can be easily extended to meet your needs. It uses Docker and PostgreSQL for easy development and deployment.

## Features

- Dockerized development and deployment
- PostgreSQL database
- Swagger and Redoc documentation
- Silky for API performance monitoring
- Unit tests
- Modular organization

## Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Installation

1. Clone this repository to your computer
2. Navigate to the project directory
3. Start the server with the command `make`

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
    └── Makefile (make commands)


## Usage

### Redoc

The API is documented with Redoc. You can access the Redoc UI at `http://0.0.0.0:8000/redoc/`.

### Swagger

The API is documented with Swagger. You can access the Swagger UI at `http://0.0.0.0:8000/swagger/`.

### Silky

Silky is used to monitor API performance. You can access the Silky UI at `http://0.0.0.0:8000/silk/`.

### Unit tests

You can run the unit tests with the command `make test`.
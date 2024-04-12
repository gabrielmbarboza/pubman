# 🍻 Pubman (Public Management)

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Testing](#testing)

## About <a name = "about"></a>

The aim of this project is to showcase my skills in developing Rails applications. It's a simple CRUD application but with some relevant features 🤓

## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to run the project.

- Docker
- docker-compose

The technologies involved in this project.

- Docker (26.0.0)
- docker-compose (2.26.1)
- Postgres (16.X)
- Elasticsearch (8.11.2)
- Twilio (for sending sms messages)
- Ruby (3.3.0)
- Rails (7.1.3)

### Installing

A step by step series of examples that tell you how to get a development env running.

Clone this repository
```bash
git clone git@github.com:gabrielmbarboza/pubman.git
```

Copy or create new files from files with the `.sample` extension and then replace the environment variables in **.env** directory.

```bash
cp app.sample app
```

```bash
cp database.sample database
```

```bash
cp twilio.sample twilio
```

Create and migrate the database.

```docker
docker compose run --rm pubman bin/rails db:create
```

```docker
docker compose run --rm pubman bin/rails db:migrate
```

or use only the task `db:setup`.

```docker
docker compose run --rm pubman bin/rails db:setup
```

Use the `pubman:dev` task to populate the development database with valid citiens.

```docker
docker compose run --rm pubman bin/rails pubman:dev
```

End with an example of getting some data out of the system or using it for a little demo.

## Usage <a name = "usage"></a>

Using Docker and docker-compose, just run the following command.

```docker
docker compose up
```

and access the following url in your broswer.

```
http://0.0.0.0:3000
```

## Testing <a name = "testing"></a>

Use the following command to run all the tests.

```docker
$ docker compose run --rm pubman bin/rails test ./test
```

## Todo <a name = "todo"></a>

- [ ] Create the integration, helpers and system tests.
- [ ] Add drag and drop events to the show, create and edit window.
- [ ] Fix the city selectbox in the edit window.


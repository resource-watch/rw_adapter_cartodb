# Resource Watch Connector for CartoDB Service

[![Build Status](https://travis-ci.org/resource-watch/rw_adapter_cartodb.svg?branch=staging)](https://travis-ci.org/resource-watch/rw_adapter_cartodb) [![Code Climate](https://codeclimate.com/github/Vizzuality/rw_adapter_cartodb/badges/gpa.svg)](https://codeclimate.com/github/Vizzuality/rw_adapter_cartodb) [![Test Coverage](https://codeclimate.com/github/Vizzuality/rw_adapter_cartodb/badges/coverage.svg)](https://codeclimate.com/github/Vizzuality/rw_adapter_cartodb/coverage)

TODO: Write a project description

## Installation

Requirements:

* Ruby 2.3.0 [How to install](https://gorails.com/setup/osx/10.10-yosemite)
* PostgreSQL 9.4+ [How to install](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/)

## Usage

### Natively

First time execute:

    bin/setup

    Or install global dependencies:

    gem install bundler

    bundle install

    cp config/database.yml.sample config/database.yml
    cp env.sample .env

    bundle exec rake db:create
    bundle exec rake db:migrate

To run application:

    bundle exec rails server

### Using Docker

### Requirements for docker

If You are going to use containers, You will need:

- [Docker](https://www.docker.com/)
- [docker-compose](https://docs.docker.com/compose/)

## Executing

Start by checking out the project from github

```
git clone https://github.com/Vizzuality/rw_adapter_cartodb.git
cd rw_adapter_cartodb
```

You can either run the application natively, or inside a docker container.

To setup the project on docker:

```
./service develop
```

To run the tests on docker:

```
./service test
```

## TEST

  Run rspec:

    bin/rspec

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request :D

### BEFORE CREATING A PULL REQUEST

  Please check all of [these points](https://github.com/resource-watch/rw_adapter_cartodb/blob/master/CONTRIBUTING.md).


# README

## Feriados Chile
Esta proyecto pretende visualizar los feriados del presente año. Para ello se obtiene la información de la API del gobierno que contiene todos los feriados legales de Chile https://apis.digital.gob.cl/fl/

### live demo
https://feriados.herokuapp.com/


### Software version

* Ruby version: ruby 3.0.0
* PostgreSQL: PostgreSQL 13.1
* Rails version: Rails 6.1.3
* yarn
* node

### Installation and setup

The instruction for the installation is available here.

#### Ruby installation and dependencies
- Install version of Ruby specified in `Gemfile` and `.ruby-version`.
- Install bundler: `gem install bundler`
- Install gems from `Gemfile`: `bundle install`
- Run `yarn install --check-files`

#### Setting
- **Environment Variables**: Use `.env.template` as a template. HOLIDAYS_API_URL='https://apis.digital.gob.cl/fl/feriados'


#### Empty database initialization
- Create database: `rails db:create`
- Run pending migrations: `rails db:migrate`
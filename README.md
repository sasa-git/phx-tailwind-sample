# Example

## copy or clone this base project

`cp -rf phoenix-dev-base phoenix-sample`

## docker build

`docker compose build`

## phx.new

link: https://hexdocs.pm/phoenix/Mix.Tasks.Phx.New.html

`mix phx.new . --app example_app --database mysql`

or exec on docker  
`docker compose run --rm app mix phx.new . --app example_app --database mysql`
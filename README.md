# Example

## copy or clone this base project

`git clone https://github.com/sasasoni/phoenix-dev-base.git phoenix-sample`

`cp -rf phoenix-dev-base phoenix-sample`

## docker build

`docker compose build`

## phx.new

link: https://hexdocs.pm/phoenix/Mix.Tasks.Phx.New.html

`mix phx.new . --app example_app --database mysql`

or exec on docker  
`docker compose run --rm app mix phx.new . --app example_app --database mysql`

## setting docker-compose and phoenix configs

change config at below...

```docker-compose.yml
db:
    image: mysql:5.7
    environment:
      - MYSQL_ROOT_PASSWORD=p@ssword
      - MYSQL_DATABASE=sample_dev # <- here
      - MYSQL_USER=sample # <- here
      - MYSQL_PASSWORD=p@ssword
      - TZ='Asia/Tokyo'
```

```dev.exs
# Configure your database
config :live_view_todos, LiveViewTodos.Repo,
  username: "live_view_todos", # <- here
  password: "p@ssword", # <- here
  hostname: "db", # <- here
  database: "live_view_todos_dev",
```

When run `docker compose up` before modify settings, maybe causes error. So you run `docker volume ls` then `docker volume rm xxx-mysqldb-local_data`

## run docker compose

`docker compose up`

## phx.routes

`docker compose run --rm app mix phx.routes`

## debug

`docker compose run --rm app iex -S mix`  
`iex -S mix`

## phx.gen

`mix phx.gen.context Service Project projects account_id:references:accounts name:string status:integer`  

## ecto

`mix ecto.migrate`  
`mix ecto.rollback --all`  
`mix ecto.gen.migrateion create_accounts`  
`mix ecto.gen auth Service Account accounts`  

## Test

`docker compose run --rm -e MIX_ENV=test app mix ecto.reset`  
`docker compose run --rm -e MIX_ENV=test app mix ecto.create`  
`docker compose run --rm -e MIX_ENV=test app mix ecto.migrate`  
`docker compose run --rm -e MIX_ENV=test app mix test`  

## i18n

generete template, extract `gettext()` from app  
`mix gettext.extract`  

generate japanese template at first  
`mix gettext.extract --merge priv/gettext --locale ja`  

extract and merge  
`mix gettext.extract --merge`

何かを追加したいときは、`gettext()`で囲って、  
`mix gettext.extract --merge --locale [ja|en]`  
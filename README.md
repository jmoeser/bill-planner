# Bill Planner

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Run locally

```
podman run --name bill_planner_dev --rm -e POSTGRES_PASSWORD=postgres \
    -p 5432:5432 -d docker.io/library/postgres:13
mix ecto.create
mix ecto.migrate
mix run priv/repo/dev-seed.exs
mix phx.server
```

Connect to DB

```
psql -U postgres -h localhost bill_planner_dev
```

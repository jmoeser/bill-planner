defmodule BillPlanner.Repo do
  use Ecto.Repo,
    otp_app: :bill_planner,
    adapter: Ecto.Adapters.Postgres
end

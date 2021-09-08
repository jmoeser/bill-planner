defmodule BillPlanner.Repo.Migrations.CreatePaidbills do
  use Ecto.Migration

  def change do
    create table(:paid_bills) do
      add :amount_in_cents, :integer
      add :paid_date, :date
      add :bill_id, references(:bills, on_delete: :nothing)

      timestamps()
    end

    create index(:paid_bills, [:bill_id])
  end
end

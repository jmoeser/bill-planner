defmodule BillPlanner.Repo.Migrations.CreateBills do
  use Ecto.Migration

  def change do
    create table(:bills) do
      add(:start_date, :date, null: false)
      add :recurrence_in_days, :integer
      add :finish_date, :date
      add :type_id, references(:types, on_delete: :nothing)
      add :provider_id, references(:providers, on_delete: :nothing)

      timestamps()
    end

    create index(:bills, [:type_id])
    create index(:bills, [:provider_id])
  end
end

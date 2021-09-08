defmodule BillPlanner.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add(:name, :string, null: false)

      timestamps()
    end

    create unique_index(:providers, [:name])
  end
end

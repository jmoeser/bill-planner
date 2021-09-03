defmodule BillPlanner.Repo.Migrations.CreateTypes do
  use Ecto.Migration

  def change do
    create table(:types) do
      add(:type, :string, null: false)
    end

    create(unique_index(:types, [:type]))

  end
end

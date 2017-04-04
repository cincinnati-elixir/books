defmodule Books.Repo.Migrations.CreateBooks.Processing.Order do
  use Ecto.Migration

  def change do
    create table(:processing_orders, primary_key: false) do
      add :number, :uuid, primary_key: true

      timestamps()
    end

  end
end

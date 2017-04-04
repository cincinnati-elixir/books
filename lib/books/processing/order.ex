defmodule Books.Processing.Order do
  use Ecto.Schema

  schema "processing_orders" do
    field :number, Ecto.UUID

    timestamps()
  end
end

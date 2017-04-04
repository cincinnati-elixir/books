defmodule Books.ProcessingTest do
  use Books.DataCase

  alias Books.Processing
  alias Books.Processing.Order

  @create_attrs %{number: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{number: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{number: nil}

  def fixture(:order, attrs \\ @create_attrs) do
    {:ok, order} = Processing.create_order(attrs)
    order
  end

  test "list_orders/1 returns all orders" do
    order = fixture(:order)
    assert Processing.list_orders() == [order]
  end

  test "get_order! returns the order with given id" do
    order = fixture(:order)
    assert Processing.get_order!(order.id) == order
  end

  test "create_order/1 with valid data creates a order" do
    assert {:ok, %Order{} = order} = Processing.create_order(@create_attrs)
    assert order.number == "7488a646-e31f-11e4-aace-600308960662"
  end

  test "create_order/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Processing.create_order(@invalid_attrs)
  end

  test "update_order/2 with valid data updates the order" do
    order = fixture(:order)
    assert {:ok, order} = Processing.update_order(order, @update_attrs)
    assert %Order{} = order
    assert order.number == "7488a646-e31f-11e4-aace-600308960668"
  end

  test "update_order/2 with invalid data returns error changeset" do
    order = fixture(:order)
    assert {:error, %Ecto.Changeset{}} = Processing.update_order(order, @invalid_attrs)
    assert order == Processing.get_order!(order.id)
  end

  test "delete_order/1 deletes the order" do
    order = fixture(:order)
    assert {:ok, %Order{}} = Processing.delete_order(order)
    assert_raise Ecto.NoResultsError, fn -> Processing.get_order!(order.id) end
  end

  test "change_order/1 returns a order changeset" do
    order = fixture(:order)
    assert %Ecto.Changeset{} = Processing.change_order(order)
  end
end

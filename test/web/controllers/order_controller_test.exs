defmodule Books.Web.OrderControllerTest do
  use Books.Web.ConnCase

  alias Books.Processing

  @create_attrs %{number: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{number: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{number: nil}

  def fixture(:order) do
    {:ok, order} = Processing.create_order(@create_attrs)
    order
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, order_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Orders"
  end

  test "renders form for new orders", %{conn: conn} do
    conn = get conn, order_path(conn, :new)
    assert html_response(conn, 200) =~ "New Order"
  end

  test "creates order and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, order_path(conn, :create), order: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == order_path(conn, :show, id)

    conn = get conn, order_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Order"
  end

  test "does not create order and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, order_path(conn, :create), order: @invalid_attrs
    assert html_response(conn, 200) =~ "New Order"
  end

  test "renders form for editing chosen order", %{conn: conn} do
    order = fixture(:order)
    conn = get conn, order_path(conn, :edit, order)
    assert html_response(conn, 200) =~ "Edit Order"
  end

  test "updates chosen order and redirects when data is valid", %{conn: conn} do
    order = fixture(:order)
    conn = put conn, order_path(conn, :update, order), order: @update_attrs
    assert redirected_to(conn) == order_path(conn, :show, order)

    conn = get conn, order_path(conn, :show, order)
    assert html_response(conn, 200)
  end

  test "does not update chosen order and renders errors when data is invalid", %{conn: conn} do
    order = fixture(:order)
    conn = put conn, order_path(conn, :update, order), order: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Order"
  end

  test "deletes chosen order", %{conn: conn} do
    order = fixture(:order)
    conn = delete conn, order_path(conn, :delete, order)
    assert redirected_to(conn) == order_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, order_path(conn, :show, order)
    end
  end
end

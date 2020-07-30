defmodule ApiProjWeb.DocumnetControllerTest do
  use ApiProjWeb.ConnCase

  alias ApiProj.Management
  alias ApiProj.Management.Documnet

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:documnet) do
    {:ok, documnet} = Management.create_documnet(@create_attrs)
    documnet
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all documents", %{conn: conn} do
      conn = get(conn, Routes.documnet_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create documnet" do
    test "renders documnet when data is valid", %{conn: conn} do
      conn = post(conn, Routes.documnet_path(conn, :create), documnet: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.documnet_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.documnet_path(conn, :create), documnet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update documnet" do
    setup [:create_documnet]

    test "renders documnet when data is valid", %{conn: conn, documnet: %Documnet{id: id} = documnet} do
      conn = put(conn, Routes.documnet_path(conn, :update, documnet), documnet: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.documnet_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, documnet: documnet} do
      conn = put(conn, Routes.documnet_path(conn, :update, documnet), documnet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete documnet" do
    setup [:create_documnet]

    test "deletes chosen documnet", %{conn: conn, documnet: documnet} do
      conn = delete(conn, Routes.documnet_path(conn, :delete, documnet))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.documnet_path(conn, :show, documnet))
      end
    end
  end

  defp create_documnet(_) do
    documnet = fixture(:documnet)
    %{documnet: documnet}
  end
end

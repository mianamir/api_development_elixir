defmodule ApiProjWeb.DocumnetController do
  use ApiProjWeb, :controller

  alias ApiProj.Management
  alias ApiProj.Management.Documnet

  action_fallback ApiProjWeb.FallbackController

  def index(conn, _params) do
    documents = Management.list_documents()
    render(conn, "index.json", documents: documents)
  end

  def create(conn, %{"documnet" => documnet_params}) do
    with {:ok, %Documnet{} = documnet} <- Management.create_documnet(documnet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.documnet_path(conn, :show, documnet))
      |> render("show.json", documnet: documnet)
    end
  end

  def show(conn, %{"id" => id}) do
    documnet = Management.get_documnet!(id)
    render(conn, "show.json", documnet: documnet)
  end

  def update(conn, %{"id" => id, "documnet" => documnet_params}) do
    documnet = Management.get_documnet!(id)

    with {:ok, %Documnet{} = documnet} <- Management.update_documnet(documnet, documnet_params) do
      render(conn, "show.json", documnet: documnet)
    end
  end

  def delete(conn, %{"id" => id}) do
    documnet = Management.get_documnet!(id)

    with {:ok, %Documnet{}} <- Management.delete_documnet(documnet) do
      send_resp(conn, :no_content, "")
    end
  end
end

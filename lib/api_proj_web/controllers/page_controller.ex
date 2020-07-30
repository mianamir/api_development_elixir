defmodule ApiProjWeb.PageController do
  use ApiProjWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

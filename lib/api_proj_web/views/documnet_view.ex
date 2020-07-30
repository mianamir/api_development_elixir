defmodule ApiProjWeb.DocumnetView do
  use ApiProjWeb, :view
  # use JaSerializer.PhoenixView

  # attributes [:name, :content, :view_count, :published, :project_id]
  alias ApiProjWeb.DocumnetView

  def render("index.json", %{documents: documents}) do
    %{data: render_many(documents, DocumnetView, "documnet.json")}
  end

  def render("show.json", %{documnet: documnet}) do
    %{data: render_one(documnet, DocumnetView, "documnet.json")}
  end

  def render("documnet.json", %{documnet: documnet}) do
    %{id: documnet.id,
      name: documnet.name,
      content: documnet.content,
      view_count: documnet.view_count,
      published: documnet.published
  }
  end
end

defmodule ApiProj.Management.Documnet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documents" do
    field :name, :string
    field :content, :string
    field :view_count, :integer
    field :published, :boolean

    belongs_to :project, ApiProj.Management.Project

    timestamps()
  end

  @doc false
  def changeset(documnet, attrs) do
    documnet
    |> cast(attrs, [:name, :content, :view_count, :published, :project_id ])
    |> validate_required([:name])
  end
end

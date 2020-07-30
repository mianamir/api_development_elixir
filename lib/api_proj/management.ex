defmodule ApiProj.Management do
  @moduledoc """
  The Management context.
  """

  import Ecto.Query, warn: false
  alias ApiProj.Repo

  alias ApiProj.Management.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias ApiProj.Management.Documnet

  @doc """
  Returns the list of documents.

  ## Examples

      iex> list_documents()
      [%Documnet{}, ...]

  """
  def list_documents do
    Repo.all(Documnet)
  end

  @doc """
  Gets a single documnet.

  Raises `Ecto.NoResultsError` if the Documnet does not exist.

  ## Examples

      iex> get_documnet!(123)
      %Documnet{}

      iex> get_documnet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_documnet!(id), do: Repo.get!(Documnet, id)

  @doc """
  Creates a documnet.

  ## Examples

      iex> create_documnet(%{field: value})
      {:ok, %Documnet{}}

      iex> create_documnet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_documnet(attrs \\ %{}) do
    %Documnet{}
    |> Documnet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a documnet.

  ## Examples

      iex> update_documnet(documnet, %{field: new_value})
      {:ok, %Documnet{}}

      iex> update_documnet(documnet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_documnet(%Documnet{} = documnet, attrs) do
    documnet
    |> Documnet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a documnet.

  ## Examples

      iex> delete_documnet(documnet)
      {:ok, %Documnet{}}

      iex> delete_documnet(documnet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_documnet(%Documnet{} = documnet) do
    Repo.delete(documnet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking documnet changes.

  ## Examples

      iex> change_documnet(documnet)
      %Ecto.Changeset{data: %Documnet{}}

  """
  def change_documnet(%Documnet{} = documnet, attrs \\ %{}) do
    Documnet.changeset(documnet, attrs)
  end
end

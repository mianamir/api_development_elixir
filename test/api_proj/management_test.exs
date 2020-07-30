defmodule ApiProj.ManagementTest do
  use ApiProj.DataCase

  alias ApiProj.Management

  describe "projects" do
    alias ApiProj.Management.Project

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Management.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Management.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Management.create_project(@valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Management.update_project(project, @update_attrs)
      assert project.description == "some updated description"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_project(project, @invalid_attrs)
      assert project == Management.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Management.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Management.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Management.change_project(project)
    end
  end

  describe "documents" do
    alias ApiProj.Management.Documnet

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def documnet_fixture(attrs \\ %{}) do
      {:ok, documnet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_documnet()

      documnet
    end

    test "list_documents/0 returns all documents" do
      documnet = documnet_fixture()
      assert Management.list_documents() == [documnet]
    end

    test "get_documnet!/1 returns the documnet with given id" do
      documnet = documnet_fixture()
      assert Management.get_documnet!(documnet.id) == documnet
    end

    test "create_documnet/1 with valid data creates a documnet" do
      assert {:ok, %Documnet{} = documnet} = Management.create_documnet(@valid_attrs)
    end

    test "create_documnet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_documnet(@invalid_attrs)
    end

    test "update_documnet/2 with valid data updates the documnet" do
      documnet = documnet_fixture()
      assert {:ok, %Documnet{} = documnet} = Management.update_documnet(documnet, @update_attrs)
    end

    test "update_documnet/2 with invalid data returns error changeset" do
      documnet = documnet_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_documnet(documnet, @invalid_attrs)
      assert documnet == Management.get_documnet!(documnet.id)
    end

    test "delete_documnet/1 deletes the documnet" do
      documnet = documnet_fixture()
      assert {:ok, %Documnet{}} = Management.delete_documnet(documnet)
      assert_raise Ecto.NoResultsError, fn -> Management.get_documnet!(documnet.id) end
    end

    test "change_documnet/1 returns a documnet changeset" do
      documnet = documnet_fixture()
      assert %Ecto.Changeset{} = Management.change_documnet(documnet)
    end
  end
end

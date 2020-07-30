alias ApiProj.Repo
alias ApiProj.Management.Documnet


Repo.insert! %Documnet{
    name: "SRS Document",
    content: "Api Development using Elixir/Phoenix",
    view_count: 1,
    published: true,
    project_id: 1

}

Repo.insert! %Documnet{
    name: "2nd SRS Document",
    content: "Api Development using Elixir/Phoenix",
    view_count: 1,
    published: false,
    project_id: 1

}

Repo.insert! %Documnet{
    name: "SRS Document",
    content: "Api Development using Elixir/Phoenix",
    view_count: 12,
    published: false,
    project_id: 2

}


Repo.insert! %Documnet{
    name: "SRS Document",
    content: "Api Development using Elixir/Phoenix",
    view_count: 5,
    published: true,
    project_id: 3

}





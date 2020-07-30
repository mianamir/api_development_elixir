defmodule ApiProj.Repo do
  use Ecto.Repo,
    otp_app: :api_proj,
    adapter: Ecto.Adapters.Postgres
end

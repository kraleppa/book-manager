defmodule AbsintheProject.Repo do
  use Ecto.Repo,
    otp_app: :absinthe_project,
    adapter: Ecto.Adapters.Postgres
end

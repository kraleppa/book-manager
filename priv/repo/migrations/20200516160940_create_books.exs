defmodule AbsintheProject.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :publisher, :string
      add :release_date, :string
      add :pages, :integer

      timestamps()
    end

  end
end

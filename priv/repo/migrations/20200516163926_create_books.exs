defmodule AbsintheProject.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :description, :string
      add :release_date, :string
      add :number_of_pages, :integer
      add :image_url, :string

      timestamps()
    end

  end
end

defmodule AbsintheProject.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :author, :string
      add :title, :string
      add :description, :string
      add :number_of_songs, :integer

      timestamps()
    end

  end
end

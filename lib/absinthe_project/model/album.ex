defmodule AbsintheProject.Model.Album do
  use Ecto.Schema
  import Ecto.Changeset

  schema "albums" do
    field :author, :string
    field :description, :string
    field :number_of_songs, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:author, :title, :description, :number_of_songs])
    |> validate_required([:author, :title, :description, :number_of_songs])
  end
end

defmodule AbsintheProject.Model.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :pages, :integer
    field :publisher, :string
    field :release_date, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :publisher, :release_date, :pages])
    |> validate_required([:title, :author, :publisher, :release_date, :pages])
  end
end

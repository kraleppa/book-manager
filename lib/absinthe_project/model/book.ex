defmodule AbsintheProject.Model.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :description, :string
    field :image_url, :string
    field :number_of_pages, :integer
    field :release_date, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :description, :release_date, :number_of_pages, :image_url])
    |> validate_required([:title, :author, :description, :release_date, :number_of_pages, :image_url])
  end
end

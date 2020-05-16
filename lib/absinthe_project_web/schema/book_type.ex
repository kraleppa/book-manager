defmodule AbsintheProjectWeb.Schema.BookType do
  use Absinthe.Schema.Notation

  object :book_type do
    field(:id, :id)
    field(:title, :string)
    field(:author, :string)
    field(:description, :string)
    field(:release_date, :string)
    field(:number_of_pages, :integer)
    field(:image_url, :string)
  end

  input_object :book_input_type do
    field(:title, non_null(:string))
    field(:author, non_null(:string))
    field(:description, non_null(:string))
    field(:release_date, non_null(:string))
    field(:number_of_pages, non_null(:integer))
    field(:image_url, non_null(:string))
  end
end

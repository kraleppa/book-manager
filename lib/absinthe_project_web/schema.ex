defmodule AbsintheProjectWeb.Schema do
  use Absinthe.Schema
  import_types AbsintheProjectWeb.Schema.BookType
  alias AbsintheProjectWeb.Resolvers

  query do
    @desc "Get all books"
    field :get_all_books, list_of(:book_type) do
      resolve &Resolvers.BookResolver.get_all_books/3
    end

    @desc "Get book by id"
    field :get_book, type: :book_type do
      arg(:id, non_null(:id))
      resolve &Resolvers.BookResolver.get_book/3
    end
  end

  mutation do
    @desc "Add new book"
    field :add_book, type: :book_type do
      arg(:input, non_null(:book_input_type))
      resolve &Resolvers.BookResolver.add_book/3
    end
  end
end


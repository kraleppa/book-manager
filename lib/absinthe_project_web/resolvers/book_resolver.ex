defmodule AbsintheProjectWeb.Resolvers.BookResolver do
  alias AbsintheProject.Model
  def get_all_books(_, _, _) do
    {:ok, Model.list_books()}
  end

  def get_book(_, %{id: id}, _) do
    case Model.get_book!(id) do
      nil -> {:error, "Book does not exist"}
      book -> {:ok, book}
    end
  end

  def add_book(_, %{input: input}, _) do
    Model.create_book(input)
  end

end

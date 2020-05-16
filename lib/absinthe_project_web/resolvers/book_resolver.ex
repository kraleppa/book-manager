defmodule AbsintheProjectWeb.Resolvers.BookResolver do
  alias AbsintheProject.Model
  def books(_, _, _) do
    {:ok, Model.list_books()}
  end

  def add_book(_, %{input: input}, _) do
    Model.create_book(input)
  end

end

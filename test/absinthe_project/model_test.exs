defmodule AbsintheProject.ModelTest do
  use AbsintheProject.DataCase

  alias AbsintheProject.Model

  describe "books" do
    alias AbsintheProject.Model.Book

    @valid_attrs %{author: "some author", pages: 42, publisher: "some publisher", release_date: "some release_date", title: "some title"}
    @update_attrs %{author: "some updated author", pages: 43, publisher: "some updated publisher", release_date: "some updated release_date", title: "some updated title"}
    @invalid_attrs %{author: nil, pages: nil, publisher: nil, release_date: nil, title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Model.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Model.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Model.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Model.create_book(@valid_attrs)
      assert book.author == "some author"
      assert book.pages == 42
      assert book.publisher == "some publisher"
      assert book.release_date == "some release_date"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Model.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Model.update_book(book, @update_attrs)
      assert book.author == "some updated author"
      assert book.pages == 43
      assert book.publisher == "some updated publisher"
      assert book.release_date == "some updated release_date"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Model.update_book(book, @invalid_attrs)
      assert book == Model.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Model.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Model.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Model.change_book(book)
    end
  end
end

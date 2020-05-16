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

  describe "albums" do
    alias AbsintheProject.Model.Album

    @valid_attrs %{author: "some author", description: "some description", number_of_songs: 42, title: "some title"}
    @update_attrs %{author: "some updated author", description: "some updated description", number_of_songs: 43, title: "some updated title"}
    @invalid_attrs %{author: nil, description: nil, number_of_songs: nil, title: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Model.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Model.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Model.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Model.create_album(@valid_attrs)
      assert album.author == "some author"
      assert album.description == "some description"
      assert album.number_of_songs == 42
      assert album.title == "some title"
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Model.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, %Album{} = album} = Model.update_album(album, @update_attrs)
      assert album.author == "some updated author"
      assert album.description == "some updated description"
      assert album.number_of_songs == 43
      assert album.title == "some updated title"
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Model.update_album(album, @invalid_attrs)
      assert album == Model.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Model.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Model.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Model.change_album(album)
    end
  end

  describe "books" do
    alias AbsintheProject.Model.Book

    @valid_attrs %{author: "some author", description: "some description", image_url: "some image_url", number_of_pages: 42, release_date: "some release_date", title: "some title"}
    @update_attrs %{author: "some updated author", description: "some updated description", image_url: "some updated image_url", number_of_pages: 43, release_date: "some updated release_date", title: "some updated title"}
    @invalid_attrs %{author: nil, description: nil, image_url: nil, number_of_pages: nil, release_date: nil, title: nil}

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
      assert book.description == "some description"
      assert book.image_url == "some image_url"
      assert book.number_of_pages == 42
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
      assert book.description == "some updated description"
      assert book.image_url == "some updated image_url"
      assert book.number_of_pages == 43
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

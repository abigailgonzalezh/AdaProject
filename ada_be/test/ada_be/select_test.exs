defmodule AdaBe.SelectTest do
  use AdaBe.DataCase

  alias AdaBe.Select

  describe "places" do
    alias AdaBe.Select.Place

    @valid_attrs %{name: "some name", places_id: 42}
    @update_attrs %{name: "some updated name", places_id: 43}
    @invalid_attrs %{name: nil, places_id: nil}

    def place_fixture(attrs \\ %{}) do
      {:ok, place} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Select.create_place()

      place
    end

    test "list_places/0 returns all places" do
      place = place_fixture()
      assert Select.list_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Select.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      assert {:ok, %Place{} = place} = Select.create_place(@valid_attrs)
      assert place.name == "some name"
      assert place.places_id == 42
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Select.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      assert {:ok, %Place{} = place} = Select.update_place(place, @update_attrs)
      assert place.name == "some updated name"
      assert place.places_id == 43
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Select.update_place(place, @invalid_attrs)
      assert place == Select.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Select.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Select.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Select.change_place(place)
    end
  end
end

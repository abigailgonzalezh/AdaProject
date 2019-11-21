defmodule AdaBe.MenuTest do
  use AdaBe.DataCase

  alias AdaBe.Menu

  describe "places" do
    alias AdaBe.Menu.Place

    @valid_attrs %{description: "some description", id_places: 42, name: "some name"}
    @update_attrs %{description: "some updated description", id_places: 43, name: "some updated name"}
    @invalid_attrs %{description: nil, id_places: nil, name: nil}

    def place_fixture(attrs \\ %{}) do
      {:ok, place} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menu.create_place()

      place
    end

    test "list_places/0 returns all places" do
      place = place_fixture()
      assert Menu.list_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Menu.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      assert {:ok, %Place{} = place} = Menu.create_place(@valid_attrs)
      assert place.description == "some description"
      assert place.id_places == 42
      assert place.name == "some name"
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      assert {:ok, %Place{} = place} = Menu.update_place(place, @update_attrs)
      assert place.description == "some updated description"
      assert place.id_places == 43
      assert place.name == "some updated name"
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_place(place, @invalid_attrs)
      assert place == Menu.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Menu.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Menu.change_place(place)
    end
  end

  describe "groups" do
    alias AdaBe.Menu.Group

    @valid_attrs %{description: "some description", id_groups: 42, name: "some name"}
    @update_attrs %{description: "some updated description", id_groups: 43, name: "some updated name"}
    @invalid_attrs %{description: nil, id_groups: nil, name: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Menu.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Menu.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Menu.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Menu.create_group(@valid_attrs)
      assert group.description == "some description"
      assert group.id_groups == 42
      assert group.name == "some name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, %Group{} = group} = Menu.update_group(group, @update_attrs)
      assert group.description == "some updated description"
      assert group.id_groups == 43
      assert group.name == "some updated name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_group(group, @invalid_attrs)
      assert group == Menu.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Menu.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Menu.change_group(group)
    end
  end
end

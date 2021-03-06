defmodule Refuge.WildthingsTest do
  use Refuge.DataCase

  alias Refuge.Wildthings

  describe "bears" do
    alias Refuge.Wildthings.Bear

    @valid_attrs %{hibernating: true, name: "some name"}
    @update_attrs %{hibernating: false, name: "some updated name"}
    @invalid_attrs %{hibernating: nil, name: nil}

    def bear_fixture(attrs \\ %{}) do
      {:ok, bear} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wildthings.create_bear()

      bear
    end

    test "list_bears/0 returns all bears" do
      bear = bear_fixture()
      assert Wildthings.list_bears() == [bear]
    end

    test "get_bear!/1 returns the bear with given id" do
      bear = bear_fixture()
      assert Wildthings.get_bear!(bear.id) == bear
    end

    test "create_bear/1 with valid data creates a bear" do
      assert {:ok, %Bear{} = bear} = Wildthings.create_bear(@valid_attrs)
      assert bear.hibernating == true
      assert bear.name == "some name"
    end

    test "create_bear/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wildthings.create_bear(@invalid_attrs)
    end

    test "update_bear/2 with valid data updates the bear" do
      bear = bear_fixture()
      assert {:ok, %Bear{} = bear} = Wildthings.update_bear(bear, @update_attrs)
      assert bear.hibernating == false
      assert bear.name == "some updated name"
    end

    test "update_bear/2 with invalid data returns error changeset" do
      bear = bear_fixture()
      assert {:error, %Ecto.Changeset{}} = Wildthings.update_bear(bear, @invalid_attrs)
      assert bear == Wildthings.get_bear!(bear.id)
    end

    test "delete_bear/1 deletes the bear" do
      bear = bear_fixture()
      assert {:ok, %Bear{}} = Wildthings.delete_bear(bear)
      assert_raise Ecto.NoResultsError, fn -> Wildthings.get_bear!(bear.id) end
    end

    test "change_bear/1 returns a bear changeset" do
      bear = bear_fixture()
      assert %Ecto.Changeset{} = Wildthings.change_bear(bear)
    end
  end
end

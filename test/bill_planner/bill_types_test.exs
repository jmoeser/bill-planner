defmodule BillPlanner.BillTypesTest do
  use BillPlanner.DataCase

  alias BillPlanner.BillTypes

  describe "types" do
    alias BillPlanner.BillTypes.Type

    import BillPlanner.BillTypesFixtures

    @invalid_attrs %{type: nil}

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert BillTypes.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert BillTypes.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      valid_attrs = %{type: "some type"}

      assert {:ok, %Type{} = type} = BillTypes.create_type(valid_attrs)
      assert type.type == "some type"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BillTypes.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      update_attrs = %{type: "some updated type"}

      assert {:ok, %Type{} = type} = BillTypes.update_type(type, update_attrs)
      assert type.type == "some updated type"
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = BillTypes.update_type(type, @invalid_attrs)
      assert type == BillTypes.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = BillTypes.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> BillTypes.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = BillTypes.change_type(type)
    end
  end
end

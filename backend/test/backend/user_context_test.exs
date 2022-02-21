defmodule Backend.UserContextTest do
  use Backend.DataCase

  alias Backend.UserContext

  describe "users" do
    alias Backend.UserContext.User

    import Backend.UserContextFixtures

    @invalid_attrs %{email: nil, full_name: nil, mobile_phone: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert UserContext.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert UserContext.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", full_name: "some full_name", mobile_phone: 42}

      assert {:ok, %User{} = user} = UserContext.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.full_name == "some full_name"
      assert user.mobile_phone == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserContext.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", full_name: "some updated full_name", mobile_phone: 43}

      assert {:ok, %User{} = user} = UserContext.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.full_name == "some updated full_name"
      assert user.mobile_phone == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = UserContext.update_user(user, @invalid_attrs)
      assert user == UserContext.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = UserContext.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> UserContext.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = UserContext.change_user(user)
    end
  end
end

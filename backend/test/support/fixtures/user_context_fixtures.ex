defmodule Backend.UserContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.UserContext` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        full_name: "some full_name",
        mobile_phone: 42
      })
      |> Backend.UserContext.create_user()

    user
  end
end

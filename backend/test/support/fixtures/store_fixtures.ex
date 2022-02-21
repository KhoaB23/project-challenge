defmodule Backend.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Store` context.
  """

  @doc """
  Generate a campaign.
  """
  def campaign_fixture(attrs \\ %{}) do
    {:ok, campaign} =
      attrs
      |> Enum.into(%{
        budget: 120.5,
        description: "some description",
        end_date: "some end_date",
        hashtags: "some hashtags",
        name: "some name",
        start_date: "some start_date",
        team_id: 42
      })
      |> Backend.Store.create_campaign()

    campaign
  end

  @doc """
  Generate a membership.
  """
  def membership_fixture(attrs \\ %{}) do
    {:ok, membership} =
      attrs
      |> Enum.into(%{
        team_id: 42,
        user_id: 42
      })
      |> Backend.Store.create_membership()

    membership
  end

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        code: "some code",
        color_set: "some color_set",
        name: "some name"
      })
      |> Backend.Store.create_team()

    team
  end
end

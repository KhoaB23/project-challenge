defmodule Backend.CampaignStoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.CampaignStore` context.
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
      |> Backend.CampaignStore.create_campaign()

    campaign
  end
end

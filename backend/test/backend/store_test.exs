defmodule Backend.StoreTest do
  use Backend.DataCase

  alias Backend.Store

  describe "campaigns" do
    alias Backend.Store.Campaign

    import Backend.StoreFixtures

    @invalid_attrs %{budget: nil, description: nil, end_date: nil, hashtags: nil, name: nil, start_date: nil, team_id: nil}

    test "list_campaigns/0 returns all campaigns" do
      campaign = campaign_fixture()
      assert Store.list_campaigns() == [campaign]
    end

    test "get_campaign!/1 returns the campaign with given id" do
      campaign = campaign_fixture()
      assert Store.get_campaign!(campaign.id) == campaign
    end

    test "create_campaign/1 with valid data creates a campaign" do
      valid_attrs = %{budget: 120.5, description: "some description", end_date: "some end_date", hashtags: "some hashtags", name: "some name", start_date: "some start_date", team_id: 42}

      assert {:ok, %Campaign{} = campaign} = Store.create_campaign(valid_attrs)
      assert campaign.budget == 120.5
      assert campaign.description == "some description"
      assert campaign.end_date == "some end_date"
      assert campaign.hashtags == "some hashtags"
      assert campaign.name == "some name"
      assert campaign.start_date == "some start_date"
      assert campaign.team_id == 42
    end

    test "create_campaign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_campaign(@invalid_attrs)
    end

    test "update_campaign/2 with valid data updates the campaign" do
      campaign = campaign_fixture()
      update_attrs = %{budget: 456.7, description: "some updated description", end_date: "some updated end_date", hashtags: "some updated hashtags", name: "some updated name", start_date: "some updated start_date", team_id: 43}

      assert {:ok, %Campaign{} = campaign} = Store.update_campaign(campaign, update_attrs)
      assert campaign.budget == 456.7
      assert campaign.description == "some updated description"
      assert campaign.end_date == "some updated end_date"
      assert campaign.hashtags == "some updated hashtags"
      assert campaign.name == "some updated name"
      assert campaign.start_date == "some updated start_date"
      assert campaign.team_id == 43
    end

    test "update_campaign/2 with invalid data returns error changeset" do
      campaign = campaign_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_campaign(campaign, @invalid_attrs)
      assert campaign == Store.get_campaign!(campaign.id)
    end

    test "delete_campaign/1 deletes the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{}} = Store.delete_campaign(campaign)
      assert_raise Ecto.NoResultsError, fn -> Store.get_campaign!(campaign.id) end
    end

    test "change_campaign/1 returns a campaign changeset" do
      campaign = campaign_fixture()
      assert %Ecto.Changeset{} = Store.change_campaign(campaign)
    end
  end

  describe "memberships" do
    alias Backend.Store.Membership

    import Backend.StoreFixtures

    @invalid_attrs %{team_id: nil, user_id: nil}

    test "list_memberships/0 returns all memberships" do
      membership = membership_fixture()
      assert Store.list_memberships() == [membership]
    end

    test "get_membership!/1 returns the membership with given id" do
      membership = membership_fixture()
      assert Store.get_membership!(membership.id) == membership
    end

    test "create_membership/1 with valid data creates a membership" do
      valid_attrs = %{team_id: 42, user_id: 42}

      assert {:ok, %Membership{} = membership} = Store.create_membership(valid_attrs)
      assert membership.team_id == 42
      assert membership.user_id == 42
    end

    test "create_membership/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_membership(@invalid_attrs)
    end

    test "update_membership/2 with valid data updates the membership" do
      membership = membership_fixture()
      update_attrs = %{team_id: 43, user_id: 43}

      assert {:ok, %Membership{} = membership} = Store.update_membership(membership, update_attrs)
      assert membership.team_id == 43
      assert membership.user_id == 43
    end

    test "update_membership/2 with invalid data returns error changeset" do
      membership = membership_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_membership(membership, @invalid_attrs)
      assert membership == Store.get_membership!(membership.id)
    end

    test "delete_membership/1 deletes the membership" do
      membership = membership_fixture()
      assert {:ok, %Membership{}} = Store.delete_membership(membership)
      assert_raise Ecto.NoResultsError, fn -> Store.get_membership!(membership.id) end
    end

    test "change_membership/1 returns a membership changeset" do
      membership = membership_fixture()
      assert %Ecto.Changeset{} = Store.change_membership(membership)
    end
  end

  describe "teams" do
    alias Backend.Store.Team

    import Backend.StoreFixtures

    @invalid_attrs %{code: nil, color_set: nil, name: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Store.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Store.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{code: "some code", color_set: "some color_set", name: "some name"}

      assert {:ok, %Team{} = team} = Store.create_team(valid_attrs)
      assert team.code == "some code"
      assert team.color_set == "some color_set"
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{code: "some updated code", color_set: "some updated color_set", name: "some updated name"}

      assert {:ok, %Team{} = team} = Store.update_team(team, update_attrs)
      assert team.code == "some updated code"
      assert team.color_set == "some updated color_set"
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_team(team, @invalid_attrs)
      assert team == Store.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Store.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Store.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Store.change_team(team)
    end
  end
end

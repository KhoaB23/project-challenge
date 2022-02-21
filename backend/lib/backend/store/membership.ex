defmodule Backend.Store.Membership do
  use Ecto.Schema
  import Ecto.Changeset

  schema "memberships" do
    field :team_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(membership, attrs) do
    membership
    |> cast(attrs, [:user_id, :team_id])
    |> validate_required([:user_id, :team_id])
  end
end

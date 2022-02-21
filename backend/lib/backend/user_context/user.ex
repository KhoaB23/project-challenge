defmodule Backend.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :full_name, :string
    field :mobile_phone, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :full_name, :mobile_phone])
    |> validate_required([:email, :full_name, :mobile_phone])
  end
end

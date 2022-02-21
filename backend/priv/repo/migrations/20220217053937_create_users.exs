defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :full_name, :string
      add :mobile_phone, :integer

      timestamps()
    end
  end
end

defmodule LoveTime.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :bio, :string
      add :encrypted_password, :string
      add :number_of_pets, :integer
      add :birthday, :date
      add :reset_password_token, :string, default: nil
      add :reset_password_token_at, :datetime, default: nil

      timestamps()
    end

  end
end

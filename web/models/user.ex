defmodule LoveTime.User do
  use LoveTime.Web, :model
  use Coherence.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :bio, :string
    field :password_hash, :string
    field :number_of_pets, :integer
    field :birthday, Ecto.Date
    field :reset_password_token, :string
    field :reset_password_token_at, Ecto.DateTime
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :reset_password_sent_at, Ecto.DateTime
    field :sign_in_count, :integer
    field :current_sign_in_at, Ecto.DateTime
    field :last_sign_in_at, Ecto.DateTime
    field :current_sign_in_ip, :string
    field :last_sign_in_ip, :string
    # unlockable_with_token
    field :unlock_token, :string
    field :failed_attempts, :integer
    field :locked_at,  Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :bio,:password_confirmation, :password, :number_of_pets, :birthday] ++ coherence_fields())
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end

  def changeset(struct, params, :registration) do
    # custom changeset  for registration controller
    struct
    |> cast(params, [:name, :email,:password_confirmation, :password] ++ coherence_fields())
    |> validate_required([:name, :email,:password_confirmation, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end

end

defmodule LoveTime.UserTest do
  use LoveTime.ModelCase

  alias LoveTime.User

  @valid_attrs %{bio: "some content", birthday: %{day: 17, month: 4, year: 2010}, email: "some content", encrypted_password: "some content", name: "some content", number_of_pets: 42, reset_password_token: "some content", reset_password_token_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end

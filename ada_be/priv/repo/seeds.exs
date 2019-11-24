# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AdaBe.Repo.insert!(%AdaBe.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias AdaBe.{Repo, Accounts.User}

[
    %{username: "admin", email: "admin@admin.com", password: "1234"},
    %{username: "abi", email: "abi@abi.com", password: "1234"},
    %{username: "fer", email: "fer@abi.com", password: "1234"}
] |> Enum.each(fn user ->
      User.changeset(%User{}, user)
      |> Repo.insert!
    end)

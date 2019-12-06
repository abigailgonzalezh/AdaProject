defmodule AdaBeWeb.RegistrationController do
    use AdaBeWeb, :controller
    alias AdaBe.Accounts.User
    alias AdaBe.Repo

    def register(conn, params) do
      IO.inspect params
      {:ok, _user } = User.changeset(%User{}, params) |> Repo.insert() 
      conn |> json( %{msg: "User was successfully registered"} )
    end

end

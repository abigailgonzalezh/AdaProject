defmodule AdaBeWeb.AuthenticationController do
    use AdaBeWeb, :controller
  
    alias AdaBe.Accounts
  
    plug Ueberauth
  
    def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
      email = auth.uid
      password = auth.credentials.other.password
      handle_user_conn(Accounts.get_user_by_email_and_password(email, password), conn)
    end
  
    defp handle_user_conn(user, conn) do
      case user do
        {:ok, user} ->
          {:ok, jwt, _full_claims} =
          {:ok, jwt, _full_claims} =
            AdaBeWeb.Guardian.encode_and_sign(user, %{})
  
            conn
            |> put_resp_header("authorization", "Bearer #{jwt}")
            |> json(%{data: %{token: jwt}})
  
        # Handle our own error to keep it generic
        {:error, _reason} ->
          conn
          |> put_status(401)
          |> json(%{message: "Authentication error"})
      end
    end
  end
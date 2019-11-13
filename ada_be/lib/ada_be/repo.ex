defmodule AdaBe.Repo do
  use Ecto.Repo,
    otp_app: :ada_be,
    adapter: Ecto.Adapters.Postgres
end

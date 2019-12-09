defmodule AdaBeWeb.GroupChannel do
    use AdaBeWeb, :channel

    alias AdaBe.Repo

    def join("group:" <> id_group, _params, socket) do

        #{:ok, socket}
        group = Repo.get!(AdaBe.Menu.Group, id_group)

        {:ok, assign(socket, :group, group)}
    end

    def terminate(_reason, socket) do
        {:ok, socket}
    end
end
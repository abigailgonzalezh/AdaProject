defmodule AdaBeWeb.GroupChannel do
    use AdaBeWeb, :channel

    def join("groups:" <> id_group, _params, socket) do
        group = Repo.get!(AdaBe.Menu.Group, id_group)

        {:ok, assign(socket, :group, group)}
    end

    def terminate(_reason, socket) do
        {:ok, socket}
    end
end
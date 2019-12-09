defmodule AdaBeWeb.GroupChannel do
    use AdaBeWeb, :channel

    alias AdaBe.Repo

    def join("group:" <> id_group, _params, socket) do

        #{:ok, socket}
        group = Repo.get!(AdaBe.Menu.Group, id_group)

        {:ok, assign(socket, :group, group)}
    end

    def handle_in("send_message", payload, socket) do
        broadcast socket, "handle_message", payload
        {:noreply, socket}
    end

    def terminate(_reason, socket) do
        {:ok, socket}
    end
end
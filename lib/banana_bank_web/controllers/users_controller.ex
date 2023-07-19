defmodule BananaBankWeb.UsersController do
  alias BananaBank.Users.Create
  use BananaBankWeb, :controller

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  def handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, user: user)
  end

  def handle_response({:error, changeset}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BananaBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end

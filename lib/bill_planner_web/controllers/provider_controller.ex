defmodule BillPlannerWeb.ProviderController do
  use BillPlannerWeb, :controller

  alias BillPlanner.Bills
  alias BillPlanner.Bills.Provider

  def index(conn, _params) do
    providers = Bills.list_providers()
    render(conn, "index.html", providers: providers)
  end

  def new(conn, _params) do
    changeset = Bills.change_provider(%Provider{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"provider" => provider_params}) do
    case Bills.create_provider(provider_params) do
      {:ok, provider} ->
        conn
        |> put_flash(:info, "Provider created successfully.")
        |> redirect(to: Routes.provider_path(conn, :show, provider))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    provider = Bills.get_provider!(id)
    render(conn, "show.html", provider: provider)
  end

  def edit(conn, %{"id" => id}) do
    provider = Bills.get_provider!(id)
    changeset = Bills.change_provider(provider)
    render(conn, "edit.html", provider: provider, changeset: changeset)
  end

  def update(conn, %{"id" => id, "provider" => provider_params}) do
    provider = Bills.get_provider!(id)

    case Bills.update_provider(provider, provider_params) do
      {:ok, provider} ->
        conn
        |> put_flash(:info, "Provider updated successfully.")
        |> redirect(to: Routes.provider_path(conn, :show, provider))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", provider: provider, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    provider = Bills.get_provider!(id)
    {:ok, _provider} = Bills.delete_provider(provider)

    conn
    |> put_flash(:info, "Provider deleted successfully.")
    |> redirect(to: Routes.provider_path(conn, :index))
  end
end

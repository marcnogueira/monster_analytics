defmodule MonsterClient do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://www.dnd5eapi.co/")
  plug(Tesla.Middleware.JSON)

  def get_monsters do
    {:ok, response} =
      "api/monsters"
      |> get()

    response.body["results"]
  end

  def get_monster(monster) do
    "api/monsters/#{monster}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: body
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "Monster not found"}
end

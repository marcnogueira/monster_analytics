defmodule Monster do
  @keys [:name, :size, :url, :xp]

  @enforce_keys @keys

  defstruct @keys

  def build(%{"name" => name, "size" => size, "url" => url, "xp" => xp}) do
    %__MODULE__{
      name: name,
      size: size,
      url: url,
      xp: xp
    }
  end

  def generate do
    monster = MonsterClient.get_monsters()
    |> Enum.random()

    monster["index"]
    |> MonsterClient.get_monster()
    |> build
  end
end

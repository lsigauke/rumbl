defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  @moduledoc """
  In memory repository
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Jose", password: "elixir"},
      %Rumbl.User{id: "2", name: "Bruce", password: "7langs"},
      %Rumbl.User{id: "3", name: "Chris", password: "phx"},
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    module
    |> all()
    |> Enum.find(fn map -> 
        map.id == id
    end)
  end 

  def get_by(module, params) do
    module
    |> all()
    |> Enum.find(fn map ->
        Enum.all?(params, fn {key, val} -> 
          Map.get(map, key) == val 
        end)
    end)
  end 
end

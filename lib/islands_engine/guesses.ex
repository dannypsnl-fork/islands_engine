defmodule IslandsEngine.Guesses do
  @moduledoc false

  alias IslandsEngine.{Guesses, Coordinate}

  @enforce_keys [:hits, :misses]
  defstruct [:hits, :misses]

  def new() do
    %Guesses{hits: MapSet.new(), misses: MapSet.new()}
  end

  def add(%Guesses{} = guess, :hit, %Coordinate{} = coordinate) do
    update_in(guess.hits, &MapSet.put(&1, coordinate))
  end

  def add(%Guesses{} = guess, :miss, %Coordinate{} = coordinate) do
    update_in(guess.misses, &MapSet.put(&1, coordinate))
  end
end

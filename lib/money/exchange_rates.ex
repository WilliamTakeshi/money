defmodule Money.ExchangeRates do
  @base_url "https://api.exchangeratesapi.io"

  @moduledoc """
  Exchange rates to support to `Money`
  """
  @spec latest!(Money.money() | atom, Money.money() | atom) :: integer
  @doc """
  Create a new 'Money' struct.

  ## Examples

      iex> Money.ExchangeRates.latest!(Money.new(100, :BRL), Money.new(10, :BRL))
      1.0
      iex> Money.ExchangeRates.latest!(:USD, :USD)
      1.0
  """
  def latest!(%Money{currency: to}, %Money{currency: from}) do
    latest!(from, to)
  end

  def latest!(from, to) when is_atom(from) and is_atom(to) do
    (@base_url <> "/latest?" <> URI.encode_query(%{"base" => from, "symbols" => to}))
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
    |> Map.get("rates")
    |> Map.get(Atom.to_string(to))
  end
end

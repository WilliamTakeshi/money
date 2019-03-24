defmodule Money do
  @moduledoc """
  Documentation for Money.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Money.new(100)
      %Money{amount: 100, currency: :BRL}

  """
  defstruct amount: 0, currency: :USD

  def new(amount, currency \\ :BRL) when is_integer(amount) do
    %Money{amount: amount, currency: currency}
  end

  def zero?(%Money{amount: amount}), do: amount == 0

  def negative?(%Money{amount: amount}), do: amount <= 0

  def equals?(%Money{amount: amt, currency: cur}, %Money{amount: amt, currency: cur}) do
    true
  end

  def equals?(%Money{}, %Money{}) do
    false
  end

  def sum(%Money{amount: amt1, currency: cur}, %Money{amount: amt2, currency: cur}) do
    Money.new(amt1 + amt2, cur)
  end

  def sum(%Money{} = a, %Money{} = b), do: currency_not_equal(a, b)

  def subtract(%Money{amount: amt1, currency: cur}, %Money{amount: amt2, currency: cur}) do
    Money.new(amt1 - amt2, cur)
  end

  def subtract(%Money{} = a, %Money{} = b), do: currency_not_equal(a, b)

  defp currency_not_equal(a, b) do
    raise ArgumentError, message: "Currency #{a.currency} and #{b.currency} must be the same"
  end
end

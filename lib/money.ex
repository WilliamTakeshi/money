defmodule Money do
  alias Money.Currency
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
    case Currency.atom(currency) do
      nil -> raise ArgumentError, message: "Currency not defined by ISO 4217"
      currency -> %Money{amount: amount, currency: currency}
    end
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

  def split(%Money{amount: amt, currency: cur}, denominator)
      when is_integer(denominator) and denominator > 0 do
    value = div(amt, denominator)
    rem = rem(amt, denominator)
    split_rem(List.duplicate(Money.new(value, cur), denominator), rem)
  end

  defp split_rem(result, 0), do: result

  defp split_rem(result, rem) do
    currency = List.first(result).currency

    Enum.reduce(0..(rem - 1), result, fn pos, result ->
      List.update_at(result, pos, &Money.sum(&1, Money.new(1, currency)))
    end)
  end

  def multiply(%Money{amount: amount, currency: cur}, multiplier) when is_integer(multiplier),
    do: Money.new(amount * multiplier, cur)

  def multiply(%Money{amount: amount, currency: cur}, multiplier) when is_float(multiplier),
    do: Money.new(round(amount * multiplier), cur)

  defp currency_not_equal(a, b) do
    raise ArgumentError, message: "Currency #{a.currency} and #{b.currency} must be the same"
  end
end

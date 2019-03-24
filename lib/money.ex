defmodule Money do
  alias Money.Currency
  defstruct amount: 0, currency: :USD

  @moduledoc """
  Defines a 'Money' struct and a couple of useful functions to work with it.
  """

  @doc """
  Create a new 'Money' struct.

  ## Examples

      iex> Money.new(100)
      %Money{amount: 100, currency: :BRL}

  """
  def new(amount, currency \\ :BRL) when is_integer(amount) do
    case Currency.atom(currency) do
      nil -> raise ArgumentError, message: "Currency not defined by ISO 4217"
      currency -> %Money{amount: amount, currency: currency}
    end
  end

  @doc """
  Return true if amount in 'Money' struct is zero.

  ## Examples

      iex> Money.zero?(Money.new(10, :USD))
      false

  """
  def zero?(%Money{amount: amount}), do: amount == 0

  @doc """
  Return true if amount in 'Money' struct is negative.

  ## Examples

      iex> Money.negative?(Money.new(-10, :USD))
      true

  """
  def negative?(%Money{amount: amount}), do: amount <= 0

  @doc """
  Return true if amount and currency of both 'Money' structs are equal.

  ## Examples

      iex> Money.equals?(Money.new(10, :USD), Money.new(10, :USD))
      true

  """
  def equals?(%Money{amount: amt, currency: cur}, %Money{amount: amt, currency: cur}) do
    true
  end

  def equals?(%Money{}, %Money{}) do
    false
  end

  @doc """
  Return the sum of both 'Money' structs, raise a error in case of different currencies.

  ## Examples

      iex> Money.sum(Money.new(10, :USD), Money.new(10, :USD))
      %Money{amount: 20, currency: :USD}

  """
  def sum(%Money{amount: amt1, currency: cur}, %Money{amount: amt2, currency: cur}) do
    Money.new(amt1 + amt2, cur)
  end

  def sum(%Money{} = a, %Money{} = b), do: currency_not_equal(a, b)

  @doc """
  Return the subtraction of both 'Money' structs, raise a error in case of different currencies.

  ## Examples

      iex> Money.subtract(Money.new(30, :USD), Money.new(10, :USD))
      %Money{amount: 20, currency: :USD}

  """
  def subtract(%Money{amount: amt1, currency: cur}, %Money{amount: amt2, currency: cur}) do
    Money.new(amt1 - amt2, cur)
  end

  def subtract(%Money{} = a, %Money{} = b), do: currency_not_equal(a, b)

  @doc """
  Return a list of money structs splitted equally.
  In case of remainder, the firsts in the list receive the change.

  ## Examples

      iex> Money.split(Money.new(30, :USD), 3)
      [%Money{amount: 10, currency: :USD}, %Money{amount: 10, currency: :USD}, %Money{amount: 10, currency: :USD},]
      iex> Money.split(Money.new(32, :USD), 3)
      [%Money{amount: 11, currency: :USD}, %Money{amount: 11, currency: :USD}, %Money{amount: 10, currency: :USD},]

  """
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

  @doc """
  Multiply the amount of a 'Money' struct, in case of the multiplier be a float
  it rounds the value.

  ## Examples

      iex> Money.multiply(Money.new(10, :USD), 3)
      %Money{amount: 30, currency: :USD}
      iex> Money.multiply(Money.new(10, :USD), 3.233)
      %Money{amount: 32, currency: :USD}
  """
  def multiply(%Money{amount: amount, currency: cur}, multiplier) when is_integer(multiplier),
    do: Money.new(amount * multiplier, cur)

  def multiply(%Money{amount: amount, currency: cur}, multiplier) when is_float(multiplier),
    do: Money.new(round(amount * multiplier), cur)

  defp currency_not_equal(a, b) do
    raise ArgumentError, message: "Currency #{a.currency} and #{b.currency} must be the same"
  end
end

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
end

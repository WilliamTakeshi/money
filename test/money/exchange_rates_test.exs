defmodule Money.ExchangeRatesTest do
  use ExUnit.Case, async: true
  doctest Money.ExchangeRates

  alias Money.ExchangeRates

  test "latest!/1" do
    assert ExchangeRates.latest!(:BRL, :BRL) == 1.0

    assert_raise BadMapError, fn ->
      ExchangeRates.latest!(:BRL, :ABX) == 1.0
    end
  end
end

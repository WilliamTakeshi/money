defmodule Money.CurrencyTest do
  use ExUnit.Case, async: true
  doctest Money.Currency

  alias Money.Currency

  test "exists?/1" do
    assert Currency.exists?(:USD)
    refute Currency.exists?(:ZZZ)
  end

  test "get/1" do
    assert Currency.get(:BRL) == %{name: "Brazilian Real", symbol: "R$", exponent: 2}

    assert Currency.get(Money.new(100, :BRL)) == %{
             name: "Brazilian Real",
             symbol: "R$",
             exponent: 2
           }

    assert Currency.get(:ZZZ) == nil
  end

  test "name/1" do
    assert Currency.name(:BRL) == "Brazilian Real"
    assert Currency.name(Money.new(100, :BRL))  == "Brazilian Real"
    assert Currency.name(:ZZZ) == nil
  end
end

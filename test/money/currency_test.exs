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
    assert Currency.name(Money.new(100, :BRL)) == "Brazilian Real"
    assert Currency.name(:ZZZ) == nil
  end

  test "symbol/1" do
    assert Currency.symbol(:BRL) == "R$"
    assert Currency.symbol(Money.new(100, :BRL)) == "R$"
    assert Currency.symbol(:ZZZ) == nil
  end

  test "atom/1" do
    assert Currency.atom("brl") == :BRL
    assert Currency.atom("bRl") == :BRL
    assert Currency.atom(Money.new(100, :BRL)) == :BRL
    assert Currency.atom(:ZZZ) == nil
  end
end

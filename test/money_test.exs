defmodule MoneyTest do
  use ExUnit.Case
  doctest Money

  test "new/1 with default currency" do
    assert Money.new(100) == %Money{amount: 100, currency: :BRL}
  end

  test "new/2 with other currency" do
    assert Money.new(100, :USD) == %Money{amount: 100, currency: :USD}
  end

  @tag :skip
  test "new/2 with a false currency should fail" do
    assert_raise ArgumentError, Money.new(100, :ZZZ)
  end
end

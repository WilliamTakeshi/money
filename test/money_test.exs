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

  test "test zero?/1" do
    assert Money.zero?(Money.new(0, :USD))
    assert Money.zero?(Money.new(0, :BRL))
    refute Money.zero?(Money.new(10, :USD))
    refute Money.zero?(Money.new(-10, :BRL))
  end

  test "test negative?/1" do
    assert Money.negative?(Money.new(0, :USD))
    refute Money.negative?(Money.new(10, :USD))
    assert Money.negative?(Money.new(-10, :BRL))
  end

  test "test equals?/2" do
    assert Money.equals?(Money.new(10, :USD), Money.new(10, :USD))
    refute Money.equals?(Money.new(10, :USD), Money.new(11, :USD))
    refute Money.equals?(Money.new(10, :BRL), Money.new(10, :USD))
  end

  test "test sum/2 with same currency" do
    assert Money.sum(Money.new(10, :USD), Money.new(10, :USD)) == Money.new(20, :USD)
    assert Money.sum(Money.new(-20, :USD), Money.new(30, :USD)) == Money.new(10, :USD)
  end

  test "test sum/2 different currency" do
    assert_raise ArgumentError, fn ->
      Money.sum(Money.new(10, :BRL), Money.new(10, :USD))
    end
  end

  test "test subtract/2 with same currency" do
    assert Money.subtract(Money.new(10, :USD), Money.new(10, :USD)) == Money.new(0, :USD)
    assert Money.subtract(Money.new(-20, :USD), Money.new(30, :USD)) == Money.new(-50, :USD)
  end

  test "test subtract/2 different currency" do
    assert_raise ArgumentError, fn ->
      Money.subtract(Money.new(10, :BRL), Money.new(10, :USD))
    end
  end
end

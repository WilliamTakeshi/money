defmodule ExCheck.MoneyTest do
  use ExUnit.Case, async: false
  use ExCheck

  property :split_maintains_money do
    for_all {x, y} in such_that({xx, yy} in {int(), int()} when yy > 0) do
      result = Money.split(Money.new(x, :BRL), y)
      Enum.reduce(result, 0, fn %Money{amount: amt}, acc -> amt + acc end) == x
    end
  end
end

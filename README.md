# Money

Simple Elixir library for working with Money. It was made as a way of studing the Exilir Lang.

---

# How to use

```elixir
ten_brl = Money.new(10_00, :BRL)                                    # %Money{amount: 1000, currency: :BRL}
Money.equals?(Money.sum(ten_brl, ten_brl), Money.new(20_00, :BRL))  # true
Money.zero?(Money.subtract(ten_brl, ten_brl))                       # true
shares = Money.split(ten_brl, 3)
[%Money{amount: 334, currency: :BRL}, %Money{amount: 333, currency: :BRL}, %Money{amount: 333, currency: :BRL}]


Money.Currency.symbol(:BRL)                   # "R$"
Money.Currency.name(Money.new(500, :BRL))     # "Brasilian Real"


Money.sum_with_conversion(Money.new(500, :BRL), Money.new(500, :USD))
```

## Mix

`mix deps.get` Download all project dependencies.

`iex -S mix` Run in iex form.

`mix test` Run tests.

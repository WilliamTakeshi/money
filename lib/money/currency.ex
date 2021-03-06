defmodule Money.Currency do
  @type currency :: %{
          exponent: integer,
          name: String.t(),
          symbol: String.t()
        }

  @moduledoc """
  Currency to support to `Money` based on ISO 4217

  """
  @currencies %{
    AED: %{name: "UAE Dirham", symbol: "د.إ", exponent: 2},
    AFN: %{name: "Afghani", symbol: "؋", exponent: 2},
    ALL: %{name: "Lek", symbol: "Lek", exponent: 2},
    AMD: %{name: "Armenian Dram", symbol: "AMD", exponent: 2},
    ANG: %{name: "Netherlands Antillian Guilder", symbol: "ƒ", exponent: 2},
    AOA: %{name: "Kwanza", symbol: "Kz", exponent: 2},
    ARS: %{name: "Argentine Peso", symbol: "$", exponent: 2},
    AUD: %{name: "Australian Dollar", symbol: "$", exponent: 2},
    AWG: %{name: "Aruban Guilder", symbol: "ƒ", exponent: 2},
    AZN: %{name: "Azerbaijanian Manat", symbol: "ман", exponent: 2},
    BAM: %{name: "Convertible Marks", symbol: "KM", exponent: 2},
    BBD: %{name: "Barbados Dollar", symbol: "$", exponent: 2},
    BDT: %{name: "Taka", symbol: "৳", exponent: 2},
    BGN: %{name: "Bulgarian Lev", symbol: "лв", exponent: 2},
    BHD: %{name: "Bahraini Dinar", symbol: ".د.ب", exponent: 3},
    BIF: %{name: "Burundi Franc", symbol: "FBu", exponent: 0},
    BMD: %{
      name: "Bermudian Dollar (customarily known as Bermuda Dollar)",
      symbol: "$",
      exponent: 2
    },
    BND: %{name: "Brunei Dollar", symbol: "$", exponent: 2},
    BOB: %{name: "Boliviano Mvdol", symbol: "$b", exponent: 2},
    BOV: %{name: "Boliviano Mvdol", symbol: "$b", exponent: 2},
    BRL: %{name: "Brazilian Real", symbol: "R$", exponent: 2},
    BSD: %{name: "Bahamian Dollar", symbol: "$", exponent: 2},
    BTN: %{name: "Indian Rupee Ngultrum", symbol: "Nu.", exponent: 2},
    BWP: %{name: "Pula", symbol: "P", exponent: 2},
    BYN: %{name: "Belarusian Ruble", symbol: "p.", exponent: 2},
    BYR: %{name: "Belarusian Ruble", symbol: "p.", exponent: 0},
    BZD: %{name: "Belize Dollar", symbol: "BZ$", exponent: 2},
    CAD: %{name: "Canadian Dollar", symbol: "$", exponent: 2},
    CDF: %{name: "Congolese Franc", symbol: "CF", exponent: 2},
    CHF: %{name: "Swiss Franc", symbol: "CHF", exponent: 2},
    CLF: %{name: "Chilean Peso Unidades de fomento", symbol: "$", exponent: 4},
    CLP: %{name: "Chilean Peso Unidades de fomento", symbol: "$", exponent: 0},
    CNY: %{name: "Yuan Renminbi", symbol: "¥", exponent: 2},
    COP: %{name: "Colombian Peso", symbol: "$", exponent: 2},
    COU: %{name: "Colombian Peso Unidad de Valor Real", symbol: "$", exponent: 2},
    CRC: %{name: "Costa Rican Colon", symbol: "₡", exponent: 2},
    CUC: %{name: "Cuban Peso Peso Convertible", symbol: "₱", exponent: 2},
    CUP: %{name: "Cuban Peso Peso Convertible", symbol: "₱", exponent: 2},
    CVE: %{name: "Cape Verde Escudo", symbol: "$", exponent: 0},
    CZK: %{name: "Czech Koruna", symbol: "Kč", exponent: 2},
    DJF: %{name: "Djibouti Franc", symbol: "Fdj", exponent: 0},
    DKK: %{name: "Danish Krone", symbol: "kr.", exponent: 2},
    DOP: %{name: "Dominican Peso", symbol: "RD$", exponent: 2},
    DZD: %{name: "Algerian Dinar", symbol: "دج", exponent: 2},
    EEK: %{name: "Kroon", symbol: "KR", exponent: 2},
    EGP: %{name: "Egyptian Pound", symbol: "£", exponent: 2},
    ERN: %{name: "Nakfa", symbol: "Nfk", exponent: 2},
    ETB: %{name: "Ethiopian Birr", symbol: "Br", exponent: 2},
    EUR: %{name: "Euro", symbol: "€", exponent: 2},
    FJD: %{name: "Fiji Dollar", symbol: "$", exponent: 2},
    FKP: %{name: "Falkland Islands Pound", symbol: "£", exponent: 2},
    GBP: %{name: "Pound Sterling", symbol: "£", exponent: 2},
    GEL: %{name: "Lari", symbol: "₾", exponent: 2},
    GHS: %{name: "Cedi", symbol: "GH₵", exponent: 2},
    GIP: %{name: "Gibraltar Pound", symbol: "£", exponent: 2},
    GMD: %{name: "Dalasi", symbol: "D", exponent: 2},
    GNF: %{name: "Guinea Franc", symbol: "FG", exponent: 0},
    GTQ: %{name: "Quetzal", symbol: "Q", exponent: 2},
    GYD: %{name: "Guyana Dollar", symbol: "$", exponent: 2},
    HKD: %{name: "Hong Kong Dollar", symbol: "$", exponent: 2},
    HNL: %{name: "Lempira", symbol: "L", exponent: 2},
    HRK: %{name: "Croatian Kuna", symbol: "kn", exponent: 2},
    HTG: %{name: "Gourde US Dollar", symbol: " ", exponent: 2},
    HUF: %{name: "Forint", symbol: "Ft", exponent: 2},
    IDR: %{name: "Rupiah", symbol: "Rp", exponent: 2},
    ILS: %{name: "New Israeli Sheqel", symbol: "₪", exponent: 2},
    INR: %{name: "Indian Rupee", symbol: "₹", exponent: 2},
    IQD: %{name: "Iraqi Dinar", symbol: "‎ع.د", exponent: 3},
    IRR: %{name: "Iranian Rial", symbol: "﷼", exponent: 2},
    ISK: %{name: "Iceland Krona", symbol: "kr", exponent: 0},
    JMD: %{name: "Jamaican Dollar", symbol: "J$", exponent: 2},
    JOD: %{name: "Jordanian Dinar", symbol: "JOD", exponent: 3},
    JPY: %{name: "Yen", symbol: "¥", exponent: 0},
    KES: %{name: "Kenyan Shilling", symbol: "KSh", exponent: 2},
    KGS: %{name: "Som", symbol: "лв", exponent: 2},
    KHR: %{name: "Riel", symbol: "៛", exponent: 2},
    KMF: %{name: "Comoro Franc", symbol: "CF", exponent: 0},
    KPW: %{name: "North Korean Won", symbol: "₩", exponent: 2},
    KRW: %{name: "Won", symbol: "₩", exponent: 0},
    KWD: %{name: "Kuwaiti Dinar", symbol: "د.ك", exponent: 3},
    KYD: %{name: "Cayman Islands Dollar", symbol: "$", exponent: 2},
    KZT: %{name: "Tenge", symbol: "лв", exponent: 2},
    LAK: %{name: "Kip", symbol: "₭", exponent: 2},
    LBP: %{name: "Lebanese Pound", symbol: "£", exponent: 2},
    LKR: %{name: "Sri Lanka Rupee", symbol: "₨", exponent: 2},
    LRD: %{name: "Liberian Dollar", symbol: "$", exponent: 2},
    LSL: %{name: "Rand Loti", symbol: " ", exponent: 2},
    LTL: %{name: "Lithuanian Litas", symbol: "Lt", exponent: 2},
    LVL: %{name: "Latvian Lats", symbol: "Ls", exponent: 2},
    LYD: %{name: "Libyan Dinar", symbol: "ل.د", exponent: 3},
    MAD: %{name: "Moroccan Dirham", symbol: "د.م.", exponent: 2},
    MDL: %{name: "Moldovan Leu", symbol: "MDL", exponent: 2},
    MGA: %{name: "Malagasy Ariary", symbol: "Ar", exponent: 2},
    MKD: %{name: "Denar", symbol: "ден", exponent: 2},
    MMK: %{name: "Kyat", symbol: "K", exponent: 2},
    MNT: %{name: "Tugrik", symbol: "₮", exponent: 2},
    MOP: %{name: "Pataca", symbol: "MOP$", exponent: 2},
    MRO: %{name: "Ouguiya", symbol: "UM", exponent: 2},
    MUR: %{name: "Mauritius Rupee", symbol: "₨", exponent: 2},
    MVR: %{name: "Rufiyaa", symbol: "Rf", exponent: 2},
    MWK: %{name: "Kwacha", symbol: "MK", exponent: 2},
    MXN: %{name: "Mexican Peso", symbol: "$", exponent: 2},
    MXV: %{name: "Mexican Peso Mexican Unidad de Inversion (UDI)", symbol: "UDI", exponent: 2},
    MYR: %{name: "Malaysian Ringgit", symbol: "RM", exponent: 2},
    MZN: %{name: "Metical", symbol: "MT", exponent: 2},
    NAD: %{name: "Rand Namibia Dollar", symbol: "$", exponent: 2},
    NGN: %{name: "Naira", symbol: "₦", exponent: 2},
    NIO: %{name: "Cordoba Oro", symbol: "C$", exponent: 2},
    NOK: %{name: "Norwegian Krone", symbol: "kr", exponent: 2},
    NPR: %{name: "Nepalese Rupee", symbol: "₨", exponent: 2},
    NZD: %{name: "New Zealand Dollar", symbol: "$", exponent: 2},
    OMR: %{name: "Rial Omani", symbol: "﷼", exponent: 3},
    PAB: %{name: "Balboa US Dollar", symbol: "B/.", exponent: 2},
    PEN: %{name: "Nuevo Sol", symbol: "S/.", exponent: 2},
    PGK: %{name: "Kina", symbol: "K", exponent: 2},
    PHP: %{name: "Philippine Peso", symbol: "Php", exponent: 2},
    PKR: %{name: "Pakistan Rupee", symbol: "₨", exponent: 2},
    PLN: %{name: "Zloty", symbol: "zł", exponent: 2},
    PYG: %{name: "Guarani", symbol: "₲", exponent: 0},
    QAR: %{name: "Qatari Rial", symbol: "﷼", exponent: 2},
    RON: %{name: "New Leu", symbol: "lei", exponent: 2},
    RSD: %{name: "Serbian Dinar", symbol: "Дин.", exponent: 2},
    RUB: %{name: "Russian Ruble", symbol: "₽", exponent: 2},
    RWF: %{name: "Rwanda Franc", symbol: " ", exponent: 0},
    SAR: %{name: "Saudi Riyal", symbol: "﷼", exponent: 2},
    SBD: %{name: "Solomon Islands Dollar", symbol: "$", exponent: 2},
    SCR: %{name: "Seychelles Rupee", symbol: "₨", exponent: 2},
    SDG: %{name: "Sudanese Pound", symbol: "SDG", exponent: 2},
    SEK: %{name: "Swedish Krona", symbol: "kr", exponent: 2},
    SGD: %{name: "Singapore Dollar", symbol: "$", exponent: 2},
    SHP: %{name: "Saint Helena Pound", symbol: "£", exponent: 2},
    SLL: %{name: "Leone", symbol: "Le", exponent: 2},
    SOS: %{name: "Somali Shilling", symbol: "S", exponent: 2},
    SRD: %{name: "Surinam Dollar", symbol: "$", exponent: 2},
    STD: %{name: "Dobra", symbol: "Db", exponent: 2},
    SVC: %{name: "El Salvador Colon US Dollar", symbol: "$", exponent: 2},
    SYP: %{name: "Syrian Pound", symbol: "£", exponent: 2},
    SZL: %{name: "Lilangeni", symbol: "E", exponent: 2},
    THB: %{name: "Baht", symbol: "฿", exponent: 2},
    TJS: %{name: "Somoni", symbol: " ", exponent: 2},
    TMT: %{name: "Manat", symbol: "₼", exponent: 2},
    TND: %{name: "Tunisian Dinar", symbol: "د.ت", exponent: 2},
    TOP: %{name: "Pa'anga", symbol: "T$", exponent: 2},
    TRY: %{name: "Turkish Lira", symbol: "TL", exponent: 2},
    TTD: %{name: "Trinidad and Tobago Dollar", symbol: "TT$", exponent: 2},
    TWD: %{name: "New Taiwan Dollar", symbol: "NT$", exponent: 2},
    TZS: %{name: "Tanzanian Shilling", symbol: "Tsh", exponent: 2},
    UAH: %{name: "Hryvnia", symbol: "₴", exponent: 2},
    UGX: %{name: "Uganda Shilling", symbol: "Ush", exponent: 0},
    USD: %{name: "US Dollar", symbol: "$", exponent: 2},
    UYI: %{name: "Peso Uruguayo Uruguay Peso en Unidades Indexadas", symbol: "$U", exponent: 0},
    UYU: %{name: "Peso Uruguayo Uruguay Peso en Unidades Indexadas", symbol: "$U", exponent: 2},
    UZS: %{name: "Uzbekistan Sum", symbol: "лв", exponent: 2},
    VEF: %{name: "Bolivar Fuerte", symbol: "Bs", exponent: 2},
    VND: %{name: "Dong", symbol: "₫", exponent: 0},
    VUV: %{name: "Vatu", symbol: "VT", exponent: 0},
    WST: %{name: "Tala", symbol: "WS$", exponent: 2},
    XAF: %{name: "CFA Franc BEAC", symbol: "FCFA", exponent: 0},
    XAG: %{name: "Silver", symbol: " ", exponent: 2},
    XAU: %{name: "Gold", symbol: " ", exponent: 2},
    XBA: %{name: "Bond Markets Units European Composite Unit (EURCO)", symbol: " ", exponent: 2},
    XBB: %{name: "European Monetary Unit (E.M.U.-6)", symbol: " ", exponent: 2},
    XBC: %{name: "European Unit of Account 9(E.U.A.-9)", symbol: " ", exponent: 2},
    XBD: %{name: "European Unit of Account 17(E.U.A.-17)", symbol: " ", exponent: 2},
    XCD: %{name: "East Caribbean Dollar", symbol: "$", exponent: 2},
    XDR: %{name: "SDR", symbol: " ", exponent: 2},
    XFU: %{name: "UIC-Franc", symbol: " ", exponent: 2},
    XOF: %{name: "CFA Franc BCEAO", symbol: " ", exponent: 0},
    XPD: %{name: "Palladium", symbol: " ", exponent: 2},
    XPF: %{name: "CFP Franc", symbol: " ", exponent: 0},
    XPT: %{name: "Platinum", symbol: " ", exponent: 2},
    XTS: %{name: "Codes specifically reserved for testing purposes", symbol: " ", exponent: 2},
    YER: %{name: "Yemeni Rial", symbol: "﷼", exponent: 2},
    ZAR: %{name: "Rand", symbol: "R", exponent: 2},
    ZMK: %{name: "Zambian Kwacha", symbol: "ZK", exponent: 2},
    ZWL: %{name: "Zimbabwe Dollar", symbol: "$", exponent: 2}
  }

  @doc """
  Return all currencies.
  """
  def all, do: @currencies

  @spec exists?(Money.money() | atom | String.t()) :: boolean()
  @doc """
  Check if the currency exists.

  ## Examples

      iex> Money.Currency.exists?(Money.new(100, :BRL))
      true
      iex> Money.Currency.exists?(:BRL)
      true
  """
  def exists?(%Money{currency: currency}),
    do: exists?(currency)

  def exists?(currency),
    do: Map.has_key?(@currencies, atom(currency))

  @spec get(Money.money() | atom | String.t()) :: currency
  @doc """
  Get currency.

  ## Examples

      iex> Money.Currency.get(Money.new(100, :BRL))
      %{exponent: 2, name: "Brazilian Real", symbol: "R$"}
      iex> Money.Currency.get(:BRL)
      %{exponent: 2, name: "Brazilian Real", symbol: "R$"}
  """
  def get(%Money{currency: currency}),
    do: get(currency)

  def get(currency),
    do: @currencies[atom(currency)]

  @spec name(Money.money() | atom | String.t()) :: String.t()
  @doc """
  Get currency name.

  ## Examples

      iex> Money.Currency.name(Money.new(100, :BRL))
      "Brazilian Real"
      iex> Money.Currency.name(:BRL)
      "Brazilian Real"
  """
  def name(%Money{currency: currency}),
    do: name(currency)

  def name(currency),
    do: get(currency)[:name]

  @spec symbol(Money.money() | atom | String.t()) :: String.t()
  @doc """
  Get currency symbol.

  ## Examples

      iex> Money.Currency.symbol(Money.new(100, :BRL))
      "R$"
      iex> Money.Currency.symbol(:BRL)
      "R$"
  """
  def symbol(%Money{currency: currency}),
    do: symbol(currency)

  def symbol(currency),
    do: get(currency)[:symbol]

  @spec atom(Money.money() | atom | String.t()) :: atom
  @doc """
  Get currency atom.

  ## Examples

      iex> Money.Currency.atom(Money.new(100, :BRL))
      :BRL
      iex> Money.Currency.atom(:BRL)
      :BRL
  """
  def atom(%Money{currency: currency}),
    do: currency

  def atom(currency) when is_binary(currency) do
    currency
    |> String.upcase()
    |> String.to_existing_atom()
    |> atom
  rescue
    _ -> nil
  end

  def atom(currency) do
    if Map.has_key?(@currencies, currency) do
      currency
    else
      nil
    end
  end
end

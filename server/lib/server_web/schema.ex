defmodule ServerWeb.Schema do
  use Absinthe.Schema

  object :player do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:books, non_null(list_of(non_null(:book))))
  end

  object :book do
    field(:id, non_null(:id))
    field(:positions, non_null(list_of(non_null(:position))))
    field(:securities, non_null(list_of(non_null(:security))))
    field(:orders, non_null(list_of(non_null(:order))))
    field(:factors, non_null(list_of(non_null(:factor))))
  end

  object :order do
    field(:book, non_null(:book))
    field(:position, non_null(:position))
    field(:security, non_null(:security))
    field(:shares, non_null(:integer))
    field(:fulfilled, non_null(:integer))
    field(:remaining, non_null(:integer))
    field(:side, non_null(:side))
  end

  object :position do
    field(:book, non_null(:book))
    field(:security, non_null(:security))
    field(:factors, non_null(list_of(non_null(:factor))))
    field(:current, non_null(:percent_notional))
    field(:target, non_null(:percent_notional))
  end

  object :security do
    field(:ticker, non_null(:string))
    field(:name, non_null(:string))
    field(:exchange, non_null(:exchange))
    field(:factors, non_null(list_of(non_null(:factor))))
  end

  object :factor do
    field(:name, non_null(:string))
    field(:exposure, non_null(:float))
  end

  object :exchange do
    field(:name, non_null(:string))
    field(:orders, non_null(list_of(non_null(:order))))
    field(:country, non_null(:country))
  end

  object :country do
    field(:name, non_null(:string))
    field(:currency, non_null(:currency))
  end

  object :currency do
    field(:ticker, non_null(:string))
    field(:name, non_null(:string))
    field(:symbol, non_null(:string))
    field(:location, non_null(:currency_location))
  end

  object :percent_notional do
    field(:percent, :float)
    field(:notional, :integer)
  end

  enum :side do
    value(:buy)
    value(:sell)
  end

  enum :currency_location do
    value(:prefix)
    value(:suffix)
  end

  object :agent do
    field(:book, non_null(:book))
    field(:strategy, non_null(:agent_strategy))
  end

  enum :agent_strategy do
    value(:liquidity_provider)
    value(:wealth)
  end

  query do
    field(:exchange, :exchange) do
      arg(:exchange, non_null(:id))

      resolve(fn _, _ ->
        {:ok, nil}
      end)
    end

    field(:orders, non_null(list_of(non_null(:order)))) do
      resolve(fn _, _ ->
        {:ok, []}
      end)
    end

    field(:player, :player) do
      arg(:player, :id)

      resolve(fn _, _ ->
        {:ok, nil}
      end)
    end

    field(:players, non_null(list_of(non_null(:player)))) do
      arg(:players, list_of(non_null(:id)))

      resolve(fn _, _ ->
        {:ok, []}
      end)
    end

    field(:positions, non_null(list_of(non_null(:position)))) do
      arg(:book, non_null(:id))

      resolve(fn _, _ ->
        {:ok, []}
      end)
    end

    field(:security, :security) do
      arg(:security, non_null(:id))

      resolve(fn _, _ ->
        {:ok, nil}
      end)
    end

    field(:securities, non_null(list_of(non_null(:security)))) do
      arg(:securities, list_of(non_null(:id)))

      resolve(fn _, _ ->
        {:ok, []}
      end)
    end

    field(:agents, non_null(list_of(non_null(:agent)))) do
      resolve(fn _, _ ->
        {:ok, []}
      end)
    end
  end
end

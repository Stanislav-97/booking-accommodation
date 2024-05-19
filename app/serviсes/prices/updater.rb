class Prices::Updater
  attr_reader :realty, :price_attrs

  def initialize(realty, price_attrs)
    @realty = realty
    @price_attrs = price_attrs
  end

  def call
    price_attrs.map do |price_attr|
      price = grouped_prices[price_attr[:date].to_date]

      if price.present?
        price.update(amount: price_attr[:amount])
      else
        realty.prices.create(price_attr)
      end
    end
  end

  private

  def grouped_prices
    @grouped_prices ||= realty.prices.index_by(&:date)
  end
end

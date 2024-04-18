class Prices::Updater
  attr_reader :price, :price_attrs, :realty

  def initialize(price, price_attrs)
    @price = price
    @price_attrs = price_attrs
    @realty = price.realty
  end

  def call
    price.update!(**price_attrs.to_h, amount:)
  end

  private

  def amount
    date_from = price_attrs[:date_from].to_date
    date_to = price_attrs[:date_to].to_date

    prices = (date_from...date_to).map do |date|
      price = realty.prices.find_by(date:)

      if price.present?
        price.amount
      else
        realty.base_price
      end
    end

    prices.sum
  end
end

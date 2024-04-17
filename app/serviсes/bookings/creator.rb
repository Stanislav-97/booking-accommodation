class Bookings::Creator
  attr_reader :realty, :booking_attrs

  def initialize(realty, booking_attrs)
    @realty = realty
    @booking_attrs = booking_attrs
  end

  def call
    realty.bookings.create!(**booking_attrs.to_h, amount:)
  end

  private

  def amount
    date_from = booking_attrs[:date_from].to_date
    date_to = booking_attrs[:date_to].to_date

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

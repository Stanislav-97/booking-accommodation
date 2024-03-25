class Bookings::Creator
  attr_reader :realty, :booking_attrs

  def initialize(realty, booking_attrs)
    @realty = realty
    @booking_attrs = booking_attrs
  end

  def call
    realty.bookings.create!(**booking_attrs.to_h, amount: amount)
  end

  private

  def amount
    date_from = booking_attrs[:date_from].to_date
    date_to = booking_attrs[:date_to].to_date

    realty.prices.where(date: date_from...date_to).sum(&:amount)
  end
end

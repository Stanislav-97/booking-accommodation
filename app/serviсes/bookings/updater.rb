class Bookings::Updater
  attr_reader :booking, :booking_attrs, :realty

  def initialize(booking, booking_attrs)
    @booking = booking
    @booking_attrs = booking_attrs
    @realty = booking.realty
  end

  def call
    booking.update!(**booking_attrs.to_h, amount: amount)
  end

  private

  def amount
    date_from = booking_attrs[:date_from].to_date
    date_to = booking_attrs[:date_to].to_date

    prices = (date_from...date_to).map do |date|
      price = realty.prices.find_by(date: date)

      if price.present?
        price.amount
      else 
        realty.base_price
      end
    end
    
    prices.sum
  end
end 
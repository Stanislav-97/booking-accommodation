class Bookings::Updater
  attr_reader :booking, :booking_attrs, :realty

  def initialize(booking, booking_attrs)
    @booking = booking
    @booking_attrs = booking_attrs
    @realty = booking.realty
  end

  def call
    date_from = booking_attrs[:date_from].to_date
    date_to = booking_attrs[:date_to].to_date
    
    prices = (date_from...date_to).map do |date|
      price = grouped_prices[(date:)]
      
      if price.present?
        #Брад, пытаюсь понять,аналогичная запись работает в updater для prices потому что я могу достать price_attr[:amount],
        #так как amount указан в параметрах в контроллере,
        #Здесь же в параметрах брони amount как бы есть, но не указан в контроллере в парамсах, поэтому мы высчитывали amount,
        # и прокидывали его в параметры таким образом  (**booking_attrs.to_h, amount:). 
        # собственно вопрсо, код ниже гавно? и надо было бы сделать вот так: 
        # price.update(**booking_attrs.to_h, amount:)(---- хотя как может работать данныя запись если теперь метода amount)
        price.update(amount: booking_attrs[:amount]) 
      else
        realty.base_price
      end
    end
    
    prices.sum
  end

  private

  def grouped_prices
    @grouped_prices ||= realty.prices.index_by(&:date)
  end
end

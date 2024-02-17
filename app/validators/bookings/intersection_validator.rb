class Bookings::IntersectionValidator < ActiveModel::Validator
  def validate(record)
    return unless intersection?(record)

    record.errors.add("Даты уже забронированы")
  end

  private

  def intersection?(record)
    realty = record.realty
    return false if realty.blank?

    booking_range = record.date_from..record.date_to
    bookings = realty.bookings
    bookings.where(date_from: booking_range).or(bookings.where(date_to: booking_range)).exists?
  end
end

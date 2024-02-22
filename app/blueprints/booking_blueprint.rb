# frozen_string_literal: true

class BookingBlueprint < Blueprinter::Base
  identifier :id

  fields :date_from, :date_to, :amount, :paid_amount, :fio, :phone, :email
end

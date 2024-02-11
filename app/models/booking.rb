class Booking < ApplicationRecord
  belongs_to :realty

  validates :realty, :amount, :paid_amount, :fio, :phone, presence: true
  validates :date_to, comparison: { greater_than: :date_from }
  validates :email, format: { with: /([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)/, message: "Неверный формат" }
end

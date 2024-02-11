class Price < ApplicationRecord
  belongs_to :realty

  validates :amount, :realty, :date, presence: true
end

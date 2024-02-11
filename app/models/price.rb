class Price < ApplicationRecord
  belongs_to :realty

  validates :amount, :realty, :date, presence: true
  validates :date, uniqueness: { scope: :realty_id }
end

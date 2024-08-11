class Realty < ApplicationRecord
  REALTY_TYPES = %w[
    flat
    house
    dacha
    townhouse
    apartments
  ].freeze

  enum realty_type: REALTY_TYPES.zip(REALTY_TYPES).to_h

  belongs_to :organization
  belongs_to :city

  has_many :users_realties
  has_many :users, through: :users_realties
  has_many :realties_facilities
  has_many :facilities, through: :realties_facilities
  has_many :realties_rates
  has_many :rates, through: :realties_rates
  has_many :prices
  has_many :bookings

  validates :address, :lat, :lon, :base_price, :realty_type, :description, :floor, :building_year, presence: true
  validates :area, comparison: { greater_than: 0 }
  validates :rooms_count, comparison: { greater_than: 0 }
  validates :entrance, comparison: { greater_than: 0 }
end

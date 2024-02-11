class Realty < ApplicationRecord
  belongs_to :organization
  
  has_many :users_realties
  has_many :users, through: :users_realties
  has_many :realties_facilities
  has_many :facilities, through: :realties_facilities
  
  validates :address, :lat, :lon, :base_price, :realty_type, :description, :floor, :building_year, presence: true
  validates :area, comparison: { greater_than: 0 }
  validates :rooms_count, comparison: { greater_than: 0 }
  validates :entrance, comparison: { greater_than: 0 }
end

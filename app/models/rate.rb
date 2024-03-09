class Rate < ApplicationRecord
  belongs_to :organization

  has_many :realties_rates
  has_many :realties, through: :realties_rates

  validates :name, :extra_change, :extra_change_type, presence: true
end

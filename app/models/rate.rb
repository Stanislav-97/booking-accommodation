class Rate < ApplicationRecord
  RATE_TYPES = %w[
    currency
    percent
  ].freeze

  enum rate_type: RATE_TYPES.zip(RATE_TYPES).to_h

  belongs_to :organization

  has_many :realties_rates
  has_many :realties, through: :realties_rates

  validates :name, :extra_change, :extra_change_type, presence: true

  validates :extra_change, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
                           if: :extra_change_type

  def extra_change_type
    rate_type == "percent"
  end
end

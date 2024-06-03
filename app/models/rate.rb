class Rate < ApplicationRecord
  EXTRA_CHARGE_TYPES = %w[
    currency
    percent
  ].freeze

  enum extra_charge_type: EXTRA_CHARGE_TYPES.zip(EXTRA_CHARGE_TYPES).to_h

  belongs_to :organization

  has_many :realties_rates
  has_many :realties, through: :realties_rates

  validates :name, :extra_charge, :extra_charge_type, presence: true

  validates :extra_charge, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
                           if: :extra_charge_type_percent?

  def extra_charge_type_percent?
    extra_charge_type == "percent"
  end
end

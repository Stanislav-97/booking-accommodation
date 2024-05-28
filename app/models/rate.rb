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

  
  #если в extra_change_type лежит percent, тогда валидация от 0 до 100 на поле extra_change
  # а тут до меня не дошло как это реализовать, ты можешь как бы намекнуть где искать, ты говорил
  #читать условную валидацию, все прочитал, не понял как это применить здесь
end

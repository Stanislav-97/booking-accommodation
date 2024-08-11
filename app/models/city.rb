class City < ApplicationRecord
  has_many :realties

  validates :name, presence: true
end

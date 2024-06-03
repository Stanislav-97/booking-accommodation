class Organization < ApplicationRecord
  has_many :realties
  has_many :users
  has_many :rates

  validates :name, presence: true
end

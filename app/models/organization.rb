class Organization < ApplicationRecord
  has_many :realties
  has_many :users

  validates :name, presence: true
end

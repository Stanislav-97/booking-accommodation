# frozen_string_literal: true

class Facility < ApplicationRecord
  has_many :realties_facilities
  has_many :realties, through: :realties_facilities

  validates :name, :icon, presence: true
end

# frozen_string_literal: true

class Price < ApplicationRecord
  belongs_to :realty

  validates :amount, :date, presence: true
  validates :date, uniqueness: { scope: :realty_id }
end

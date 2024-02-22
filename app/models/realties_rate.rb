# frozen_string_literal: true

class RealtiesRate < ApplicationRecord
  belongs_to :realty
  belongs_to :rate
end

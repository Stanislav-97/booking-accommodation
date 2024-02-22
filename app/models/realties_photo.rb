# frozen_string_literal: true

class RealtiesPhoto < ApplicationRecord
  belongs_to :realty

  validates :photo, presence: true
end

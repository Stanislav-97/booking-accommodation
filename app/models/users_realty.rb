# frozen_string_literal: true

class UsersRealty < ApplicationRecord
  belongs_to :user
  belongs_to :realty
end

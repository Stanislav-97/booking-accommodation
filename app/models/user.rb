# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :organization

  has_many :users_realties
  has_many :realties, through: :users_realties

  validates :first_name, :last_name, :phone, presence: true
  validates :phone, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)/ }, if: :email_present?

  def email_present?
    email.present?
  end
end

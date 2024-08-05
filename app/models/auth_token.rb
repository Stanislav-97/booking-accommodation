class AuthToken < ApplicationRecord
  belongs_to :user

  validates :token, :expires_at, presence: true
  validates :user_id, uniqueness: true
end

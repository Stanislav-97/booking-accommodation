class UsersRealty < ApplicationRecord
  belongs_to :user
  belongs_to :realty
end

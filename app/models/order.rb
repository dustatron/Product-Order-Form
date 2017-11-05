class Order < ApplicationRecord
  has_one :User
  has_many :items
  # has_secure_token 
  # protect_from_forgery with: :exception
  # before_action :authenticate_model!
end

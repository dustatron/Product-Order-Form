class User < ApplicationRecord
    validates_format_of :email, with: /\@email\.com/, message: 'You should have an email from email.com'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

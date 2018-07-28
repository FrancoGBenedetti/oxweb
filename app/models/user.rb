class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  has_many :products, through: :orders

  enum role: [:customer, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def set_cart
    Order.where(user_id: current_user.id, payed: false)
  end
end

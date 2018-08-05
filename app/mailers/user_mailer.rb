class UserMailer < ApplicationMailer
  default to: 'galaz.becerra@gmail.com'
  def quotation(user)
    @user = user
    @orders = Order.where(user_id: user.id, payed: false)
    mail(subject: "cotización #{@user.email}", from: @user.email)
  end
end

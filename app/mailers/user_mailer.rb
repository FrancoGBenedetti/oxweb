class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def quotation(user)
    @user = user
    @orders = Order.where(user_id: user.id, payed: false)
    mail(to: @user.email, subject: "cotización #{@user.email}")
  end
end

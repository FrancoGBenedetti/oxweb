class UserMailer < ApplicationMailer
  default to: 'ox@oxchile.com'
  def quotation(user)
    @user = user
    @orders = Order.where(user_id: user.id, payed: false)
    mail(subject: "cotización #{@user.email}", from: @user.email)
  end

  def contact(message, mail, phone, company, name)
    @message = message
    @mail = mail
    @phone = phone
    @company = company
    @name = name
    mail(subject: 'contacto', from: @mail)
  end
end

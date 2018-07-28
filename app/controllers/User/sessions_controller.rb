# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    session_id = session.id
    super
    @orders = Order.where(session: session_id)
    @orders.each do |order|
      order.user_id = current_user.id
      order.save
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
    def after_sign_in_path_for(user)
      if user.admin?
        admin_dashboard_path
      else
        root_path
      end
    end
end

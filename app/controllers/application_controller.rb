class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Acrescentar nome de usuário como atributo para cadastro
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :username, :password, :password_confirmation) }
  end

  # Método que redireciona usuário não-logado para a página 'Welcome'
  protected
  def authenticate_user!(options={})
    if user_signed_in?
      super(options)
    else
      redirect_to welcome_path #, :notice => 'if you want to add a notice'
    end
  end
end

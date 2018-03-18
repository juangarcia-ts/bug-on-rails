class ApplicationController < ActionController::Base
  protected
  def authenticate_user!(options={})
    if user_signed_in?
      super(options)
    else
      redirect_to welcome_path #, :notice => 'if you want to add a notice'
    end
  end
end

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Response
  include ExceptionHandler
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  #before_action :authorize_request

  respond_to :json

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

end

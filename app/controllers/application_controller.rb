class ApplicationController < ActionController::Base
  def require_auth
    redirect_to root_path unless session[:auth] || Rails.env.development?
  end

  def square_client
    square_api_client = Square::SquareApiClient.new
    square_api_client.access_token = 
    Rails.env.development? ? 
    Rails.application.credentials.dig(:square, :square_access_token)    
    :
    session[:auth]['credentials']['token']

    return square_api_client
  end
end

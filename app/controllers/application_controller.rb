class ApplicationController < ActionController::Base
  def require_auth
    # redirect_to root_path unless session[:auth] || Rails.env.development?
    if Rails.env.development?
      mock_session_for_dev unless session[:user]
    else
      redirect_to root_path unless session[:auth]
    end
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

  def mock_session_for_dev
    sites = square_client.list_sites
      
    @local_sites = sites.map { |site| Site.find_or_create_by(site_id: site[:id], domain: site[:domain]) }
    @user = @local_sites.first.user
    unless @user
      @user = User.create
      player = @user.create_player
      @local_sites.each { |site| site.update(user_id: @user.id) }
    end
    session[:user] = @user
  end


end

class SessionsController < ApplicationController
  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only. 
  skip_before_action :verify_authenticity_token, only: :create

  def create
    session[:auth] = auth_hash
    sites = square_client.list_sites
      #   # THIS IS A PATCH UNTIL I FIGURE SOMETHING ELSE OUT TO MOCK TOKEN/OAUTH IN DEVELOPMENT ENVIRONMENT 
    @local_sites = sites.map { |site| Site.find_or_create_by(site_id: site[:id], domain: site[:domain]) }
    @user = @local_sites.first.user
    unless @user
      @user = User.create
      player = @user.create_player
      @local_sites.each { |site| site.update(user_id: @user.id) }
    end
    # ^^^^^^^^^
    session[:user] = @user

    redirect_to player_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
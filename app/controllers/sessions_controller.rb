class SessionsController < ApplicationController
  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only. 
  skip_before_action :verify_authenticity_token, only: :create

  def create
    session[:auth] = auth_hash
    sites = square_client.list_sites
    
    @local_sites = sites.map { |site| Site.find_or_create_by(site_id: site[:id], domain: site[:domain]) }
    @user = @local_sites.first.user
    unless @user
      @user = User.create
      player = @user.create_player
      @local_sites.each { |site| site.update(user_id: @user.id) }
    end
    session[:user] = @user

    redirect_to player_path
  end

  # def self.mock_session_for_dev
  #   sites = ApplicationController.square_client.list_sites
    
  #   @local_sites = sites.map { |site| Site.find_or_create_by(site_id: site[:id], domain: site[:domain]) }
  #   @user = @local_sites.first.user
  #   unless @user
  #     load_user
  #   end
  #   session[:user] = @user
  #   # THIS IS A PATCH UNTIL I FIGURE SOMETHING ELSE OUT TO MOCK TOKEN/OAUTH IN DEVELOPMENT ENVIRONMENT
  # end

  # def load_session
  # end

protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

# User
# id
# email
# merchant_id
# name

# Player
# id
# user_id, User has one Player

# Track
# id
# player_id, Player has many Tracks

# Site
  # id  
  # user_id, User has many Sites
  # site_id = id from client
  # site_domain
  # site_title


# User has many Sites
# User has one Player
# Player has many Tracks

# Create User model
# Create Player model
# Create Site model
# Update Tracks Model

    # Project.where(name: 'Ruby on Rails', status: 'active').first_or_create
# session[:user] = 
# Site = Struct.new(:id, :site_title, :domain, :is_published, :created_at, :updated_at, keyword_init: true)
#   Snippet = Struct.new(:id, :site_id, :content, :created_at, :updated_at, keyword_init: true)
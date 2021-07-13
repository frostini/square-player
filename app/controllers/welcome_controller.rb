class WelcomeController < ApplicationController
  before_action :require_auth, except: [:index]
  
  def index
    @tracks = Player.first.tracks
    render 'index', layout: 'landing'
  end
end

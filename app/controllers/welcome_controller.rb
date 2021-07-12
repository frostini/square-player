class WelcomeController < ApplicationController
  before_action :require_auth, except: [:index]
  
  def index
    @tracks = Track.all
    render 'index', layout: 'landing'
  end

  def show
    @tracks = Track.all
    @track = Track.find_by(id: params[:id]) || Track.new
    @audio = Track.last
  end

end

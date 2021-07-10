class WelcomeController < ApplicationController
  before_action :require_auth, except: [:index]
  after_action :allow_iframe, only: :iframe
  
  def index
  end

  def show
    @tracks = Track.all
    @track = Track.find_by(id: params[:id]) || Track.new
    @audio = Track.last
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end

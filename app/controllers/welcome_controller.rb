class WelcomeController < ApplicationController
  def index
  end

  def show
    @tracks = Track.all
    @track = Track.find_by(id: params[:id]) || Track.new
    @audio = Track.last
  end

end

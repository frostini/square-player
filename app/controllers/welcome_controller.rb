class WelcomeController < ApplicationController
  def index
  end

  def show
    @tracks = Track.all
    @track = Track.find_by(id: params[:id]) || Track.new
    @audio = Track.last
  end

  def create
    @track = Track.new(person_params)
    if @track.save
      redirect_to root_path
    else
      redirect_to welcome_path(track.id)
    end
  end

private
  def person_params
    params.require(:track).permit(:title, :position, :artist, :main_image)
  end

end

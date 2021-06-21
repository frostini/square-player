class WelcomeController < ApplicationController
  def index
  end

  def show
    @tracks = Track.all
    @track = Track.find_by(id: params[:id]) || Track.new
  end

  def create
    # binding.pry
    @track = Track.new(person_params)
    if @track.save
      redirect_to root_path
    else
      redirect_to welcome_path
    end
  end

private
  def person_params
    params.require(:track).permit(:title, :position, :artist, :main_image)
  end

end

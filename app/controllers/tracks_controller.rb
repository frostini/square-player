class TracksController < ApplicationController
  before_action :set_track, only: [:show, :update]
  def index
    @tracks = Track.all
  end

  def show
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to @track
    else
      redirect_to welcome_path(track.id)
    end
  end
  
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :index }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def track_params
    params.require(:track).permit(:title, :position, :artist, :main_image)
  end

  def set_track
    @track = Track.find_by(id: params[:id])
    redirect_to root_path unless @track
  end

end

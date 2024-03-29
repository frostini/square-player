class TracksController < ApplicationController
  before_action :set_track, only: [:show, :update]
  before_action :require_auth

  def index
    @tracks = Player.find_by(user_id: session[:user]["id"]).tracks
  end

  def show
  end

  def new
    @track = Track.new
  end

  def create
    @player = Player.find_by(user_id: session[:user]["id"])
    @track = Track.new(track_params.merge({player_id: @player.id}))
    if @track.save
      redirect_to @track
    else
      redirect_to welcome_path(track.id)
    end
  end

  def destroy
    Track.destroy(params[:id])
    redirect_to tracks_path
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
    params.require(:track).permit(:title, :position, :artist, :cover_image, :full_audio, :link, :link_title)
  end

  def set_track
    @track = Track.find_by(id: params[:id])
    redirect_to root_path unless @track
  end

end

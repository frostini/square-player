class PlayersController < ApplicationController
  before_action :require_auth

  def show
    @tracks = Track.all
    @sites = square_client.list_sites
    Rails.logger.debug(@sites)
    # binding.pry
    @snippet = square_client.get_snippet(@sites.last.id)
  end

  def iframe
    @tracks = Track.all
  end

  def create
    @tracks = Track.all
    square_client.upsert_snippet(params[:format], content)
    
    redirect_to player_path
  end

  def destroy
    square_client.delete_snippet params[:format]
    redirect_to player_path
  end

private
  def content
    # render_to_string(action: "iframe", :layout => false)
    render_to_string(partial: 'players/inject')
  end

  # def create_params
  #   params.require(:snippet).permit(:text)
  # end

end

class PlayersController < ApplicationController
  before_action :require_auth

  def show
    @tracks = Track.all
    @sites = square_client.list_sites
    Rails.logger.debug(@sites)
    # binding.pry
    @snippet = square_client.get_snippet(@sites.last.id)
  end

  def create
    @tracks = Track.all
    square_client.upsert_snippet(params[:format], render_to_string(partial: 'players/inject'))
    redirect_to player_path
  end

  def destroy
    square_client.delete_snippet params[:format]
    redirect_to player_path
  end

private
  # def create_params
  #   params.require(:snippet).permit(:text)
  # end

end

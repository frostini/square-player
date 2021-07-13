class PlayersController < ApplicationController
  before_action :require_auth, except: [:iframe]

  def show
    @tracks = Player.first.tracks
    @custom_tracks = Player.find_by(user_id: session[:user]["id"]).tracks

    user_sites = square_client.list_sites
    if user_sites
      @sites = user_sites.map do |site| 
        snippet = square_client.get_snippet(site.id)
        { site: site, snippet: snippet}
      end
    end
  end

  def iframe
    @tracks = Player.find(params[:id]).tracks

    render inline: '<%= render "players/iframe" %>', layout: 'layouts/slim'
  end

  def create
    player = Player.find_by(user_id: session[:user]["id"])
    square_client.upsert_snippet(params[:format], content(player.id))
    
    redirect_to player_path
  end

  def destroy
    square_client.delete_snippet params[:format]
    redirect_to player_path
  end

private
  def content(id)
    render_to_string(partial: 'players/inject', locals: {player_id: id})
  end
end

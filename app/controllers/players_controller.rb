class PlayersController < ApplicationController
  before_action :require_auth, except: [:iframe]

  def show
    @tracks = Track.all
    user_sites = square_client.list_sites
    if user_sites
      @sites = user_sites.map do |site| 
        snippet = square_client.get_snippet(site.id)
        { site: site, snippet: snippet}
      end
    end
    # @snippet = square_client.get_snippet(@sites.last.id)
    # @snippet = square_client.get_snippet(x.id)
    # binding.pry
  end

  def iframe
    @tracks = Track.all

    # render partial: "players/iframe", layout: "slim"
    render inline: '<%= render "players/iframe" %>', layout: 'layouts/slim'
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

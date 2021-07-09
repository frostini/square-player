------------------todo
-CREATE FULL VERSION OF PLAYER

create player

 - create audio component as a viewcomponent
 - add stimulus example and test if working
  - console log for play click handler
DONE

 - create html / css for player, with individual elements
html
  sticky footer
    player left
      cover image
        transform size-square
        transform circle
        animate rotate
      bottom play/pause circle button
      details circle button
    title / time center
      track title
      artist detail
      playing time - 

    buy now right

controller
 - initialize player Audio element and load source
 
 component
 - load data (list)
 - conditional render, single song
 
 controller
 - attach play/pause handler to button
 - update track method
    path param (back, navigation)
      example for list onClick
    default = 0 unless next in index
      end of track, play next, or start



 - create controlled drawer component with toggle button
 - add play/pause control element to form
    look into icons for primer framework if needed.

*create abstracted view component
chers



 - load all songs/multiple songs
 
 - add list element for tracks in drawer
  - include play link handler
  - include add to cart/link

-design player embed and page
  -components
  -functions/actions

  -load song names/artist, image, URL, click to link, link title
  -view song list

---------------------

-add remove song to track show page
  -remove song
    -are you sure alert

-tracks (index page )
  -create proper table/header of song elements
  -link to show element


(IF NEEDED) Add Player Model (3)
ID, is_active, on_site_id, provider_id, content

-methods
  update content
  tracks, string(,)
  content
  host_site
  is_active

PROFILE
snippet on page (SQUARE)
(view/player_page link stand alone)
(view/player_page link iframe (footer))

--------
-add drag/drop ordering and serializing
for player tracks
  -logic added in player page

--------todo end


OTHER NOTES

create
add to site
remove from site
is on site
update player



player
  pull in site data
  and display




API MODELS
SNIP
[:id, :site_id, :content, :created_at, :updated_at]

SITE
[:id, :site_title, :domain, :is_published, :created_at, :updated_at]


------------------------

show page (1)
-cover scene
  *-curate data into a thumbcard / song interface
  -*stretch goal, re-capture for next-redirect to index if it doesn't exist
    flash message

------------------------

FUTURE
show page
  form UX
    clear/save
    state based button
    in-line

------------------------



DONE
add credentials and fallback client for development environment requests (key vs token)

show page (1)
-cover scene
    -update cover image details
    -add support for song files
    -add audio player for track
    -add click to link, link title attributes
    

remove all home page and set up route based navigation
  welcome 
    index - no
    show - yes
  tracks - yes
    index
    new
    shoe
  players - yes
    show

------------------------
-add snippet API to player page
  -post to add
  -delete to remove
    -add a simple console.log function to ensure that is working
  -add audio script for a 
-add most barebones MVP version of player


------------------------


GEMS

# Square Omniauth
gem 'omniauth-square', github: "nickrobinson/omniauth-square"

# RestClient
gem 'rest-client'


APPLICATION CONTROLLER
add require auth method
add square client config method

SESSIONS CONTROLLER
create session
auth hash

ROUTES
get "/", to: "welcome#index", as: 'welcome'
get '/auth/:provider/callback', to: 'sessions#create'
resources :sites, only: [:index, :show] do 
  resources :snippets, only: [:create, :destroy]
end


OMNIAUTH INITIALIZER
config/omniauth

VIEWS
sites/show
welcome/index

LIB/SQUARE_API_CLIENT
**actual square client and they added the rest client

APP CONFIG
config/application.rb

config.autoload_paths << Rails.root.join('lib')


SITES CONTROLLER
create index 
create show
authenticate with require auth

SNIPPETS CONTROLLER
create
destroy




https://pragmaticstudio.com/tutorials/using-active-storage-in-rails


<audio-player 
  data-controller="audio-player--audio-player">
<audio onplay="playing()"  slot="title" preload="metadata" controls controlsList= "nodownload">
<source src=<%=url_for(@track.full_audio)%> type="audio/mpeg">
Your browser does not support the audio element.
</audio>
</audio-player>
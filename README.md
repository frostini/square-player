DONE
update in html
 - title
 - artist

controller
- create base for controller

- load data types in controller file
  - title
  - artist

add click handlers in controller to play/pause button
add click handlers in controller to menu button
- implement play/pause logic

- initialize player Audio element and load source file in controller
- add click handlers in controller to buy now button and implement
- make player link for embed dynamic in _inject script
add quantico font to website
add open sans font to website
add navbar
add logo to navbar
add title text component
add subtitle component text
add sign up with square custom button 
add supporting text below button "Free for Square Sites"
add authenticated navigation component as route controller
  /player (link)
  /tracks (customize)
- test basic styling in the embedded square website example
  - implement play/pause logic for icon details
    - prep play svg in illustrator
      - save file in app
      - include file in element
      - style round button
    - prep pause svg in illustrator
      - save file in app
      - add conditional element to swap with play on toggle (look into view component usage for this)
  - style image cover 
    add handler to animate rotate on play
    transform image into circle
    add circle in center to spin
  - style player text (title/artist)
  - style buy button
  GO TO DESIGN THE ENTIRE EXPERIENCE FOR FINAL IMPLEMENTATION
DONE--
  -add title
  

add list/table of square sites

  -add site url to open target 
  -add toggle form and button
  -add conditional for button to lock when chosen and remove text to be revealed

- finish player show view to manage player details
- 

----------

ADD TRACKS FINAL VERSION OF PAGE
  Add title
  add subtext (specify copy as well)



- dynamically load the ID of the player for the embed script

----------
- update player when changes surface
- implement click handler for details menu logic
  - load data (list)
  - update track method
    path param (back, navigation)
      example for list onClick
    default = 0 unless next in index
      end of track, play next, or start
- add functionality to play/buy links in list

  - add duration bar logic and element
  - add duration bar styling
  
- clean up components (unmounting, refactor, complete behavioral affinity)
- final styling of component for mobile
- add iframe loading indicator


------------------todo

DONE

 - create audio component as a viewcomponent
 - add stimulus example and test if working
  - console log for play click handler

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


------------------todo




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


CAPTURED
optimize image on uplodad for size/display of cover





<script>
document.addEventListener("DOMContentLoaded", ready);
function ready() {
  console.log('ready')
  document.querySelector("#id-checkbox").addEventListener("click",
    function(event) {
      console.log('clickity')
      event.preventDefault();
      window.location.href = '/product/digital-album/1'
    }
  , false);
}
</script>
<div 
style='
  position: fixed  ;
  z-index: 100;
  width: 100vw;
  height: 50px;
  left: 0;
  right: 0;
  bottom: 0;
'
  >
  <div
  style="display:flex;flex-direction:column;"
  >
  
  <a id="id-checkbox" href="">testing here</a>
  <audio controls>
  
    <source src=<%=@tracks.last.full_audio.url%> type="audio/mpeg">
    Your browser does not support the audio element.
  </audio>
  </div>
</div>




<script>
document.addEventListener("DOMContentLoaded", ready);
function ready() {
  console.log('ready')
  document.querySelector("#id-checkbox").addEventListener("click",
    function(event) {
      console.log('clickity')
      event.preventDefault();
      window.location.href = '/product/digital-album/1'
    }
  , false);
}
</script>




<!--

# https://flaviocopes.com/html-audio-tag/
# https://developer.mozilla.org/en-US/docs/Web/Guide/Audio_and_video_delivery/Cross-browser_audio_basics
# https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement
# https://developer.mozilla.org/en-US/docs/Web/HTML/Element/audio
# https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Video_and_audio_content
https://letsbuildui.dev/articles/building-an-audio-player-with-react-hooks

https://www.geeksforgeeks.org/create-a-music-player-using-javascript/
https://ide.geeksforgeeks.org/tryit.php/T3gdWUn4aX
http://talkerscode.com/webtricks/create-custom-audio-player-using-html5-and-javascript.php


-->


import { Controller } from "stimulus"

export default class extends Controller {
// Targets
// let now_playing 
// let track_art 
// let track_name 
// let track_artist 
 
// let playpause_btn 
// let next_btn 
// let prev_btn 
 
// let seek_slider 
// let volume_slider 
// let curr_time 
// let total_duration 
 
// Values
// let track_index = 0;
// let isPlaying = false;
// let updateTimer;
  static targets = [ "menu", "title", "artist", "play", "link" ]
  static values = { 
    tracks: Array,
    index: Number,
    isPlaying: Boolean,
  }
  initialize() {
    this.audioObj = new Audio();
    const firstTrack = JSON.parse(this.tracksValue[this.tracksValue.length - 1])
    this.loadTrack(firstTrack)
  }
  connect() {
    console.log(`Hello, Stimulus! ${this.indexValue} ${this.isPlayingValue}`) 
  }
  menu() {
    console.log('open menu')
  }
  updateTrack() {

  }
  clearTrack() {

  }
  loadTrack(track) {
    const { title, artist, fileUrl, link, linkTitle } = track
    
    this.linkTarget.innerHTML = linkTitle
    this.linkTarget.href = link
    this.titleTarget.innerHTML = title;
    this.artistTarget.innerHTML = artist;
    this.audioObj.src = fileUrl;
    this.audioObj.load();
  }
  visitTarget(event) {
    debugger
    event.preventDefault();
    window.location.href = '/product/digital-album/1'
  }
  playPauseTrack() {
    this.isPlaying ? this.pauseTrack() : this.playTrack();
  }
  playTrack() {
    this.audioObj.play();
    this.isPlaying = true
    this.logEvent('clicked to play track')
  }
  pauseTrack() {
    this.audioObj.pause();
    this.isPlaying = false
    this.logEvent('clicked to pause track')
  }
  logEvent(message) {
    console.log(message)
  }
  // load track
    // Reset all the values of the previous track 
    // Loading the track 
    // Updating the track art to be shown 
    // Updating the track details to be shown 
    // Adding event listeners to the track 

  // play
  // pause
  // trackClick




  // get new track data
  // clean player data

  //

 
}
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "menu", "title", "artist", "play", "link", "image" ]
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
    const { title, artist, fileUrl, link, linkTitle, imageUrl } = track
    this.imageTarget.src = imageUrl
    this.linkTarget.innerHTML = linkTitle
    this.linkTarget.href = link
    this.titleTarget.innerHTML = title;
    this.artistTarget.innerHTML = artist;
    this.audioObj.src = fileUrl;
    this.audioObj.load();
  }
  playPauseTrack() {
    this.isPlaying ? this.pauseTrack() : this.playTrack();
  }
  playTrack() {
    this.playTarget.firstElementChild.classList.add('h-hidden')
    this.playTarget.lastElementChild.classList.remove('h-hidden')
    this.imageTarget.classList.add('h-spin')
    this.audioObj.play();
    this.isPlaying = true
    this.logEvent('clicked to play track')
  }
  pauseTrack() {
    this.playTarget.firstElementChild.classList.remove('h-hidden')
    this.playTarget.lastElementChild.classList.add('h-hidden')
    this.imageTarget.classList.remove('h-spin')
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
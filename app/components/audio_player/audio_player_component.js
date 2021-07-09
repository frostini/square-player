class AudioPlayerComponent extends HTMLElement {
  styles() {
    return `
      :host {
        display: block;
      }
      .testing { background-color: red; height: 100px; width: 100%; }
    `
  }

  constructor() {
    super()
    const shadow = this.attachShadow({mode: 'open'});
    shadow.innerHTML = `
      <style>
        ${this.styles()}
      </style>
      <div class="testing">
        <slot name="title"></slot>
      </div>
    `
  }
}
customElements.define('audio-player', AudioPlayerComponent)
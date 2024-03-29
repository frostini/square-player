class HelloWorld extends HTMLElement {
  styles() {
    return `
      :host {
        display: block;
      }
      .testing { background-color: blue; height: auto; width: 100%; }
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
        <slot name="content"></slot>
      </div>
    `
  }
}
customElements.define('hello-world', HelloWorld)
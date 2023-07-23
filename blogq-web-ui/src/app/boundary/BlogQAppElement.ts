import BoundaryElement from "../../BoundaryElement.ts";
import {html} from "lit";
import {readAuthState, readIsLoggedIn} from "../../auth/control/AuthStateReaders.ts";

class BlogQAppElement extends BoundaryElement {

  constructor() {
    super();
  }

  protected get view(): any {
    if(readIsLoggedIn(readAuthState(this.state))){
      return html`<bq-post-list/>`;
    }
    return html`<bq-auth-button data-with-register="true"></bq-auth-button>`;
  }
}

customElements.define('bq-app', BlogQAppElement);

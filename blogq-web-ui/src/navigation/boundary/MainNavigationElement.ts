import BoundaryElement from "../../BoundaryElement.ts";
import {html} from "lit";
import {appName} from "../../configuration/entity/app-config.ts";
import {readAuthState, readIsLoggedIn} from "../../auth/control/AuthStateReaders.ts";

class MainNavigationElement extends BoundaryElement {

  constructor() {
    super();
  }


  protected get view(): any {
    let me = html``;
    const authState = readAuthState(this.state);
    if (readIsLoggedIn(authState)) {
      me = html`
          <a class="navbar-item" href="/me">
              Account
          </a>
      `;
    }
    return html`
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a class="navbar-item" href="#">
            ${appName()}
          </a>

          <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false"
             data-target="navbarBasicExample">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
          </a>
        </div>

        <div id="navbarBasicExample" class="navbar-menu">
          <div class="navbar-start">
            <a class="navbar-item" href="/">
              Home
            </a>

            <a class="navbar-item" href="/posts">
              Posts
            </a>

            <a class="navbar-item" href="/write-post">
              Write Post
            </a>
          </div>

          <div class="navbar-end">
            <div class="navbar-item">
              <div class="buttons">
                ${me}
                <bq-auth-button></bq-auth-button>
              </div>
            </div>
          </div>
        </div>
      </nav>
    `;
  }
}


customElements.define("bq-navigation", MainNavigationElement);
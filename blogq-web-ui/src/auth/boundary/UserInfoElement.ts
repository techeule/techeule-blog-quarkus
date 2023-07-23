import BoundaryElement from "../../BoundaryElement.ts";
import {html} from "lit";
import {readAuthState, readIsLoggedIn, readName, readUserProfile} from "../control/AuthStateReaders.ts";
import oidcService from "../control/OidcService.ts";

class UserInfoElement extends BoundaryElement {

  constructor() {
    super();
  }

  protected get view(): any {
    if (!readIsLoggedIn(this.state)) {
      return html``;
    }
    const userProfile = readUserProfile(this.state)
    if (readIsLoggedIn(this.state) && userProfile !== undefined) {
      let verified = 'not ';

      if (userProfile.emailVerified) {
        verified = '';
      }

      return html`
          <div class="card">
              <div class="card-content">
                  <div class="media">
                      <div class="media-left">
                          <figure class="image is-48x48">
                              <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                          </figure>
                      </div>
                      <div class="media-content">
                          <p class="title is-4">${readName(this.state)}</p>
                          <p class="subtitle is-6">${userProfile.email} (${verified}verified)</p>
                      </div>
                  </div>

                  <div class="content">
                      <p class="container">User-ID: ${userProfile.id}</p>
                      <p class="container">Username: ${userProfile.username}</p>
                      <br>
                      <time datetime="${userProfile.createdTimestamp}">${userProfile.createdTimestamp}</time>
                  </div>
              </div>
              <footer class="card-footer">
                  <a href="${oidcService.accountUrl()}" target="_blank" class="card-footer-item">Edit</a>
              </footer>
          </div>
      `;
    }
  }

  protected extractState(reduxState: any): any {
    return readAuthState(reduxState);
  }
}

customElements.define('bq-user-info', UserInfoElement)

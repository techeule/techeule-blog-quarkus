import BoundaryElement from "../../BoundaryElement.ts";
import {readAuthState, readIsLoggedIn} from "../control/AuthStateReaders.ts";
import {html} from "lit";
import {navigate} from "../../navigation/control/Navigator.ts";
import {dispatchLogout} from "../control/AuthDispatchers.ts";
import oidcService from "../control/OidcService.ts";

class AuthButtonElement extends BoundaryElement {

  constructor() {
    super();
  }

  protected get view(): any {
    if (readIsLoggedIn(this.state)) {
      return this._logoutView;
    } else {

      if (this.dataset.withRegister == "true") {
        return html`
          ${this._loginView}
          ${this._registerView}
        `;
      } else {
        return this._loginView;
      }
    }
  }

  private get _loginView(): any {

    return html`
      <button class="button is-info" @click=${(e: UIEvent) => this.onLogin(e)}>Login</button>
    `;
  }

  private get _logoutView(): any {
    return html`
      <button class="button is-danger" @click=${(e: UIEvent) => this.onLogout(e)}>Logout</button>
    `;
  }

  private get _registerView(): any {
    return html`
      <button class="button is-danger" @click=${(e: UIEvent) => this.onRegister(e)}>Create Account</button>
    `;
  }

  protected extractState(reduxState: any): any {
    return readAuthState(reduxState);
  }

  private onLogout(_event: Event) {
    dispatchLogout();
    navigate('/logout');
  }

  private onLogin(event: Event) {
    event.stopPropagation();
    navigate('/login');
  }

  private onRegister(_e: UIEvent) {
    oidcService.register();
  }
}

customElements.define('bq-auth-button', AuthButtonElement);
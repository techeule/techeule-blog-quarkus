import BoundaryElement from "../../BoundaryElement.ts";
import {property} from "lit/decorators.js"
import {hasAnyPermission, readAuthState, readIsLoggedIn} from "../control/AuthStateReaders.ts";


class SecuredElement extends BoundaryElement {
  @property({attribute: 'required-permissions', type: String})
  claimValue: string = "";
  @property({attribute: 'claim-name', type: String})
  claimName: string = "";
  private _permissions: string[] = [];
  private childrenNodes: Node[] = [];

  constructor() {
    super();
  }

  protected extractState(reduxState: any): any {
    return readAuthState(reduxState);
  }

  protected get view(): any {
    return null;
  }

  refreshPermissions() {
    if (this.claimValue && this.claimValue.length > 0) {
      this._permissions = this.claimValue.split(/,/).map(r => r.trim()).filter(r => r.length > 0).sort()
    } else {
      this._permissions = []
    }
  }

  protected beforeRender() {
    super.beforeRender();
    this.refreshPermissions();
    this._removeElementsIfNeeded();
  }

  private _isLoggedInAndHasPermissions(): boolean {
    return readIsLoggedIn(this.state) && hasAnyPermission(this.state, this._permissions, this.claimName)
  }

  private _removeElementsIfNeeded() {
    if (this._isLoggedInAndHasPermissions()) {
      if (this._hasHiddenChildrenNodes()) {
        const children = this.childrenNodes.slice();
        for (const child of children) {
          this.childrenNodes = this.childrenNodes.filter(cc => cc != child);
          this.appendChild(child);
        }
        this.childrenNodes = [];
      }
    } else {
      while (this.firstChild) {
        this.childrenNodes.push(this.removeChild(this.firstChild));
      }
    }
  }

  private _hasHiddenChildrenNodes() {
    return this.childrenNodes && this.childrenNodes.length > 0;
  }
}

customElements.define("bq-secured", SecuredElement);

declare global {
  interface HTMLElementTagNameMap {
    "bq-secured": SecuredElement;
  }
}

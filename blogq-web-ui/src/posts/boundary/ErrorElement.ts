import BoundaryElement from "../../BoundaryElement.ts";
import {html} from "lit";
import {readError, readHasError, readPostsState} from "../control/PostsStateReader.ts";
import {changeClearError} from "../control/PostsDispatcher.ts";

class PostErrorElement extends BoundaryElement {

  constructor() {
    super();
  }

  protected extractState(reduxState: any): any {
    return readPostsState(reduxState);
  }

  protected get view(): any {
    if (readHasError(this.state)) {
      return html`
        <div class="notification is-danger">
          <button class="delete" @click="${(_e: UIEvent) => {
            changeClearError();
          }}"></button>
          <p>
            ${readError(this.state)}
          </p>
        </div>
      `;
    }

  }
}

customElements.define('bq-post-error', PostErrorElement);
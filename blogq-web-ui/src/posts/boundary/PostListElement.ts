import BoundaryElement from "../../BoundaryElement.ts";
import {html} from "lit";
import {deletePostById, fetchAllPosts} from "../control/PostsDispatcher.ts";
import {readPosts, readPostsState} from "../control/PostsStateReader.ts";
import {PostEntity} from "../entity/PostsState.ts";

class PostListElement extends BoundaryElement {

  constructor() {
    super();
  }


  protected get view(): any {
    const postEntities = readPosts(this.state).map((post, index, posts) => this.renderPost(post, index, posts))

    return html`
      <div class="container">
        ${this.refreshPosts()}
      </div>
      <bq-post-error/>
      
      ${postEntities}
    `;
  }

  private refreshPosts() {
    return html`
      <button class="button is-primary" @click="${(_e: UIEvent) => this.fetchAllPosts()}">
        Fetch All Posts
      </button>`;
  }

  protected extractState(reduxState: any): any {
    return readPostsState(reduxState);
  }

  private fetchAllPosts() {
    fetchAllPosts();
  }

  private renderPost({post, createdBy, createdAt}: PostEntity, _index: number, _posts: PostEntity[]) {
    const tags = (post.tags || []).map(t => html`<span class="tag is-info">${t}</span>`);

    return html`
      <article class="message is-light">
        <div class="message-header">
          <p class="title">${post.title}</p>
        </div>
        <div class="message-body has-text-left">
          <h2 class="sub-title">${post.subtitle}</h2>
          <div class="container">
            ${post.content}
            <p class="container"><span>Tags: </span>${tags}</p>
          </div>
          <div class="container">
            <p>Created At: <em>
              <time datetime="${createdAt}">${createdAt}</time>
            </em></p>
            <p>Author-Id: ${createdBy}</p>
          </div>
          <button class="button is-danger" @click="${(_e: UIEvent) => this.delete(post.id)}">Delete</button>
        </div>
      </article>
    `;
  }

  private delete(id: string) {
    deletePostById(id);
  }
}

customElements.define('bq-post-list', PostListElement);

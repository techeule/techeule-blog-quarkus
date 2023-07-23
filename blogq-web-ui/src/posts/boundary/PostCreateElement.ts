import BoundaryElement from "../../BoundaryElement.ts";
import {html} from "lit";
import {readDraftPost, readIsPending, readPostsState} from "../control/PostsStateReader.ts";
import {
  changeDraftPostContent,
  changeDraftPostSubTitle,
  changeDraftPostTags,
  changeDraftPostTitle,
  changeDraftReset,
  createPost
} from "../control/PostsDispatcher.ts";

class PostCreateElement extends BoundaryElement {

  constructor() {
    super();
  }

  protected extractState(reduxState: any): any {
    return readPostsState(reduxState);
  }

  protected get view(): any {
    const draftPost = readDraftPost(this.state)
    return html`
      <div class="container  is-full-mobile is-max-desktop">
        <section class="box">
          <h1 class="title has-text-centered">Create new Post</h1>

          <bq-post-error/>

          <form @submit=${(e: UIEvent) => this.submitForm(e)} action="#">

            <div class="field">
              <label class="label">Title</label>
              <div class="control">
                <input
                  class="input"
                  type="text"
                  name="title"
                  placeholder="Blog Post Title"
                  required
                  @keyup="${(e: UIEvent) => this.setPostProperty(e)}"
                  value="${draftPost.title}">
              </div>
            </div>

            <div class="field">
              <label class="label">Sub Title</label>
              <div class="control">
                <input
                  class="input"
                  type="text"
                  name="subtitle"
                  placeholder="Blog Post Sub Title"
                  required
                  @keyup="${(e: UIEvent) => this.setPostProperty(e)}"
                  value="${draftPost.subtitle}">
              </div>
            </div>

            <div class="field">
              <label class="label">Content</label>
              <div class="control">
                        <textarea
                          class="textarea"
                          placeholder="Blog Post Content"
                          name="content"
                          required
                          @keyup="${(e: UIEvent) => this.setPostProperty(e)}"
                          value="${draftPost.content}">${draftPost.content}</textarea>
              </div>
            </div>

            <div class="field">
              <label class="label">Tags</label>
              <div class="control">
                <input
                  class="input"
                  type="text"
                  name="tags"
                  placeholder="Blog Post Tags"
                  required
                  @keyup="${(e: UIEvent) => this.setPostProperty(e)}"
                  value="${draftPost.tags?.join(',').toLowerCase()}">
              </div>
            </div>

            <div class="field is-grouped">
              ${this.getButtonView()}
            </div>

          </form>
      </div>
    `;
  }

  submitForm(event: UIEvent) {
    const {target} = event;
    const form: HTMLFormElement = target as HTMLFormElement;
    console.log("before: preventDefault")
    event.preventDefault();
    event.stopPropagation();
    console.log("after: preventDefault")

    form.reportValidity();
    if (form.checkValidity()) {
      console.log("create post")
      console.debug(this.state)
      createPost(readDraftPost(this.state))
    }
  }

  getButtonView() {
    if (this.isPending()) {
      return html`
        <p class="control">
          <progress class="progress is-large is-primary" max="100">60%</progress>
        </p>
      `
    } else {
      return html`
        <p class="control">
          <input type="submit" class="button is-medium is-primary" value="Create"/>
        </p>
        <p class="control has-background-primary">
          <input type="reset" class="button is-medium is-primary" value="Clear Form" @click=${(e: UIEvent) => this.resetForm(e)}/>
        </p>
      `
    }
  }

  private setPostProperty(e: UIEvent) {
    const target = e.target as HTMLInputElement;
    this._setPostProperty(target.name, target.value);
  }

  private _setPostProperty(propertyName: string, propertyValue: string) {
    switch (propertyName) {
      case 'title':
        changeDraftPostTitle(propertyValue);
        break;
      case 'subtitle':
        changeDraftPostSubTitle(propertyValue);
        break;
      case 'content':
        changeDraftPostContent(propertyValue);
        break;
      case 'tags':
        changeDraftPostTags(propertyValue.trim().split(',').map(t => t.trim().toLowerCase()).filter(t => t.length > 0));
        break;
    }
  }

  private isPending() {
    return readIsPending(this.state);
  }

  private resetForm(_e: UIEvent) {
    changeDraftReset();
  }
}

customElements.define('bq-post-create', PostCreateElement);
import {PostEntity, PostEntityMap, PostsState} from "./PostsState.ts";

const _fulfillState = (state: PostsState) => {
  state.actionState = "Fulfilled";
  state.errorMessage = undefined;
};

export const setPostInMap = (posts: PostEntityMap, newPost: PostEntity) => {
  posts[newPost.post.id] = newPost
};

export const setPostInState = (state: PostsState, postEntity: PostEntity) => {
  _fulfillState(state);
  const postsMap = state.state || {};
  setPostInMap(postsMap, postEntity)
  state.state = postsMap;
}

export const replaceAllPostsInState = (state: PostsState, postEntities: PostEntity[]) => {
  _fulfillState(state);
  const postsMap = {};
  postEntities?.forEach(p => setPostInMap(postsMap, p));
  state.state = postsMap;
}

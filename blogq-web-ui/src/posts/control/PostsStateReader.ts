import {getPostInitialState, postsSliceName} from "../entity/PostsConstants.ts";
import {Post, PostEntity, PostsState} from "../entity/PostsState.ts";

export const readPostsState = (state: any) => {
  if (typeof state === 'object' && !Array.isArray(state) && Object.keys(state).includes(postsSliceName)) {
    return state[postsSliceName] as PostsState;
  } else {
    return getPostInitialState();
  }
};

export const readPosts = (postsState?: PostsState): PostEntity[] => {
  if (postsState && postsState.state) {
    return Object.values(postsState.state);
  }
  return []
}

export const readDraftPost = (postsState?: PostsState): Post => postsState && postsState.draftPost || {} as Post

export const readIsPending = (postsState?: PostsState): boolean => postsState && postsState.actionState === "Pending" || false;

export const readHasError = (postsState?: PostsState): boolean => postsState && postsState.actionState === "Error" || false;

export const readError = (postsState?: PostsState) => postsState && postsState.errorMessage;

export const readPostById = (postId: string, postsState?: PostsState): PostEntity | undefined => {
  if (postsState && postsState.state && Object.keys(postsState.state).includes(postId)) {
    return postsState.state[postId]
  }
}
import {Post, PostEntity, PostsState} from "./PostsState.ts";
import {createSlice, PayloadAction} from "@reduxjs/toolkit";
import {getPostInitialState, postsSliceName} from "./PostsConstants.ts";
import {extraReducers} from "./PostsApiActions.ts";
import {replaceAllPostsInState, setPostInState} from "./postReducerFunctions.ts";

const _fulfillState = (state: PostsState) => {
  state.actionState = "Fulfilled";
  state.errorMessage = undefined;
};

const reducers = {
  clearError(state: PostsState) {
    _fulfillState(state);
  },
  setPost(state: PostsState, action: PayloadAction<PostEntity>) {
    setPostInState(state, action.payload);
  },
  replaceAllPosts(state: PostsState, action: PayloadAction<PostEntity[]>) {
    replaceAllPostsInState(state, action.payload)
  },
  deleteAllPosts(state: PostsState) {
    _fulfillState(state);
    state.state = undefined;
  },
  draftPostSetTitle(state: PostsState, action: PayloadAction<string>) {
    _fulfillState(state);
    state.draftPost = state.draftPost || {} as Post;
    state.draftPost.title = action.payload;
  },
  draftPostSetSubTitle(state: PostsState, action: PayloadAction<string>) {
    _fulfillState(state);
    state.draftPost = state.draftPost || {} as Post;
    state.draftPost.subtitle = action.payload;
  },
  draftPostSetContent(state: PostsState, action: PayloadAction<string>) {
    _fulfillState(state);
    state.draftPost = state.draftPost || {} as Post;
    state.draftPost.content = action.payload;
  },
  draftPostSetTags(state: PostsState, action: PayloadAction<string[]>) {
    _fulfillState(state);
    state.draftPost = state.draftPost || {} as Post;
    state.draftPost.tags = action.payload;
  },
  draftPostReset(state: PostsState, action: PayloadAction<Post | undefined>) {
    _fulfillState(state);
    state.draftPost = action.payload || {} as Post;
  }
};

const initialState = getPostInitialState();

const sliceOptions = {
  name: postsSliceName,
  initialState,
  reducers,
  extraReducers
}

const postsSlice = createSlice(sliceOptions);

export const {
  clearError,
  setPost,
  replaceAllPosts,
  deleteAllPosts,
  draftPostSetTitle,
  draftPostSetSubTitle,
  draftPostSetContent,
  draftPostSetTags,
  draftPostReset
} = postsSlice.actions;
export default postsSlice.reducer;
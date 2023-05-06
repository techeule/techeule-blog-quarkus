import {ActionReducerMapBuilder} from "@reduxjs/toolkit/src/mapBuilders.ts";
import {Post, PostsState} from "./PostsState.ts";
import {createAsyncThunk} from "@reduxjs/toolkit";
import {postsSliceName} from "./PostsConstants.ts";
import {createPost, fetchPostById, fetchPosts} from "./PostsApiClient.ts";
import {replaceAllPostsInState, setPostInState} from "./postReducerFunctions.ts";
import {logout} from "../../auth/entity/AuthStoreSlice.ts";

export const createPostAction = createAsyncThunk(postsSliceName + "/create",
  async (post: Post) => createPost(post));

const addReducersForCreatePostAction = (builder: ActionReducerMapBuilder<PostsState>) => {
  builder.addCase(createPostAction.fulfilled, (state, action) => {
    console.debug({state, action})
    setPostInState(state, action.payload);
    state.draftPost = undefined;
  }).addCase(createPostAction.pending, (state, _action) => {
    console.debug({state, _action})
    state.actionState = "Pending";
  }).addCase(createPostAction.rejected, (state, action) => {
    const error = JSON.parse(<string>action.payload)
    console.debug({state, action, error})
    state.actionState = "Error";
    state.errorMessage = error.message;
  })
}


export const fetchPostAction = createAsyncThunk(postsSliceName + "/fetchById",
  async (postId: string) => fetchPostById(postId));

const addReducersForFetchPostAction = (builder: ActionReducerMapBuilder<PostsState>) => {
  builder.addCase(fetchPostAction.fulfilled, (state, action) => {
    console.debug({state, action})
    setPostInState(state, action.payload);
  }).addCase(fetchPostAction.pending, (state, _action) => {
    console.debug({state, _action})
    state.actionState = "Pending";
  }).addCase(fetchPostAction.rejected, (state, action) => {
    const error = JSON.parse(<string>action.payload)
    console.debug({state, action, error})
    state.actionState = "Error";
    state.errorMessage = error.message;
  })
}


export const fetchPostsAction = createAsyncThunk(postsSliceName + "/fetchAll",
  async () => fetchPosts());

const addReducersForFetchPostsAction = (builder: ActionReducerMapBuilder<PostsState>) => {
  builder.addCase(fetchPostsAction.fulfilled, (state, action) => {
    console.debug({state, action})
    replaceAllPostsInState(state, action.payload);
  }).addCase(fetchPostsAction.pending, (state, _action) => {
    console.debug({state, _action})
    state.actionState = "Pending";
  }).addCase(fetchPostsAction.rejected, (state, action) => {
    console.debug({state, action})
    // const error = JSON.parse(<string>action.payload)
    // state.actionState = "Error";
    // state.errorMessage = error.message;
  })
}

const addReducerForLogoutAction = (builder: ActionReducerMapBuilder<PostsState>) => {
  builder.addCase(logout().type, (state, action) => {
    state.state = undefined;
    state.actionState = "Fulfilled";
    console.debug({...action}, {...state});
  })
}

export const extraReducers = (builder: ActionReducerMapBuilder<PostsState>) => {
  addReducerForLogoutAction(builder);
  addReducersForCreatePostAction(builder);
  addReducersForFetchPostAction(builder);
  addReducersForFetchPostsAction(builder);
}
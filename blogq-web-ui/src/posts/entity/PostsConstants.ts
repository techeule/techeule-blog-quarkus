import {PostsState} from "./PostsState.ts";

export const postsSliceName : 'postsSlice' = 'postsSlice'

export const getPostInitialState = (): PostsState => ({
  actionState: "Fulfilled",
  state: undefined,
  draftPost: undefined
});



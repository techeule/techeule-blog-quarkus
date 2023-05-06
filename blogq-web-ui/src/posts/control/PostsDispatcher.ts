import {createPostAction, fetchPostsAction} from "../entity/PostsApiActions.ts";
import applicationStore from "../../redux/control/ApplicationStore.ts";
import {draftPostReset, draftPostSetContent, draftPostSetSubTitle, draftPostSetTags, draftPostSetTitle} from "../entity/PostsStoreSlice.ts";
import {Post} from "../entity/PostsState.ts";

export const fetchAllPosts = () => applicationStore.dispatch(fetchPostsAction());

export const changeDraftPostTitle = (value: string) => applicationStore.dispatch(draftPostSetTitle(value));
export const changeDraftPostSubTitle = (value: string) => applicationStore.dispatch(draftPostSetSubTitle(value));
export const changeDraftPostContent = (value: string) => applicationStore.dispatch(draftPostSetContent(value));
export const changeDraftPostTags = (value: string[]) => applicationStore.dispatch(draftPostSetTags(value));
export const changeDraftReset = () => applicationStore.dispatch(draftPostReset(undefined));

export const createPost = (post: Post) => applicationStore.dispatch(createPostAction(post));

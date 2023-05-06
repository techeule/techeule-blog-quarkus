import {authSliceName} from "../../auth/entity/AuthConstants.ts";
import {default as authReducer} from "../../auth/entity/AuthStoreSlice.ts"
import {postsSliceName} from "../../posts/entity/PostsConstants.ts";
import {default as postsReducer} from "../../posts/entity/PostsStoreSlice.ts";

const rootReducer = {
  [authSliceName]: authReducer,
  [postsSliceName]: postsReducer
};

export default rootReducer;
import {ReduxStateHolder} from "../../redux/entity/ReduxStateHolder.ts";

export interface Post {
  id: string,
  title: string,
  subtitle: string,
  content: string,
  tags: string[]
}

export interface PostEntity {
  post: Post
  createdBy: string,
  createdAt: string,
  lastModifiedBy: string,
  lastModifiedAt: string
}

export interface PostEntityMap {
  [key: string]: PostEntity
}

export interface PostsState extends ReduxStateHolder<PostEntityMap> {
  draftPost?: Post
}
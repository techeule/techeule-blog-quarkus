import {Post, PostEntity} from "./PostsState.ts";
import {backendRootUrl} from "../../configuration/entity/backend-config.ts";
import {withToken} from "../../auth/control/OidcService.ts";

function _fetchByUrl(postUrl: URL): Promise<any> {
  return withToken(async (token) => {
    console.debug(`token=${token}`)
    const fetchResponse = await fetch(postUrl, {
      "method": "GET",
      headers: {
        "Accept": "application/json",
        "Authorization": `Bearer ${token.trim()}`
      }
    })

    if (fetchResponse.status === 200) {
      return fetchResponse.json()
    } else if (fetchResponse.status > 200 && fetchResponse.status < 300) {
      return new Promise((resolve, _reject) => {
        resolve([]);
      });
    } else if (fetchResponse.status === 404) {
      throw new Error(JSON.stringify({
        code: "TE-BlogQ-ACCESS-FETCH_POST",
        message: "Credentials are wrong"
      }))
    }

    throw new Error(JSON.stringify(await fetchResponse.json()))
  })
}

const _fetchPostByUrl = async (postUrl: URL): Promise<PostEntity> => {
  return _fetchByUrl(postUrl).then(p => p as PostEntity);
}

export const createPost = async (post: Post) => {

  const url = backendRootUrl() + "/posts";
  return withToken(async (token) => {
    const request = {
      method: 'POST',
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${token}`
      },
      body: JSON.stringify(post)
    };

    const response = await fetch(url, request);
    if (response.status === 201 && response.headers.get('Location') != null) {
      return _fetchPostByUrl(new URL(response.headers.get('Location')!))
    } else {
      throw new Error(JSON.stringify(await response.json()))
    }
  });
}

export const fetchPostById = async (id: string) => {
  const getUrl = backendRootUrl() + "/post/" + id;
  return _fetchPostByUrl(new URL(getUrl));
}

export const fetchPosts = async () => {
  const getUrl = backendRootUrl() + "/posts";
  console.debug("fetchPosts => ", getUrl)
  return _fetchByUrl(new URL(getUrl)).then(r => {
    console.debug("response ", r);
    return r as PostEntity[];
  });
}


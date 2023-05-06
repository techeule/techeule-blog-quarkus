import {Router} from "@vaadin/router";

const navigate = (path: string | { pathname: string, search?: string, hash?: string }): boolean => {
  return Router.go(path)
}

export {navigate}
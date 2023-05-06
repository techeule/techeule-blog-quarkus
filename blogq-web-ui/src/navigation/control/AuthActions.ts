import {Router} from "@vaadin/router";
import {readAuthState, readIsLoggedIn} from "../../auth/control/AuthStateReaders.ts";
import applicationStore from "../../redux/control/ApplicationStore.ts";
import oidcService from "../../auth/control/OidcService.ts";
import {fetchAllPosts} from "../../posts/control/PostsDispatcher.ts";

const isLoggedIn = () => readIsLoggedIn(readAuthState(applicationStore.getState()));
const isLoggedOut = () => !isLoggedIn();

const logout: Router.ActionFn = (_context: Router.Context, commands: Router.Commands): any => {
  if (isLoggedIn()) {
    return oidcService.logout().then(_ => commands.redirect('/'));
  }
  return commands.redirect('/');
};

const login: Router.ActionFn = (_context: Router.Context, commands: Router.Commands): any => {
  if (isLoggedOut()) {
    return oidcService.login().then(_ => commands.redirect('/'));
  }
  return commands.redirect('/');
};


const requireLogin: Router.ActionFn = (context: Router.Context, commands: Router.Commands): any => {
  if (isLoggedOut()) {
    return commands.redirect('/login');
  }

  // this is only a hack/work-around. It can be done better
  if (context.route.name && context.route.name == 'posts-list') {
    fetchAllPosts();
  }

  return null;
};


export {login, logout, requireLogin}
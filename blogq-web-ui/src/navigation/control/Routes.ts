import {Router} from "@vaadin/router";
import {login, logout, requireLogin} from "./AuthActions.ts";

const routes: Router.Route[] = [
  {
    name: 'login',
    path: '/login',
    action: login
  },
  {
    name: 'logout',
    path: '/logout',
    action: logout
  },
  {
    name: 'auth',
    path: '/auth',
    component: 'bq-auth-button',
  },
  {
    name: 'me',
    path: '/me',
    component: 'bq-user-info',
    action: requireLogin
  },
  {
    name: 'root',
    path: '/',
    component: 'bq-app'
  },
  {
    name: 'posts-list',
    path: '/posts',
    component: 'bq-post-list',
    action: requireLogin
  },
  {
    name: 'write-post',
    path: '/write-post',
    component: 'bq-post-create',
    action: requireLogin
  }
];

export default routes;
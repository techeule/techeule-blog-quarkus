import {authSliceName, getAuthInitialState} from "../entity/AuthConstants.ts";
import {AuthState} from "../entity/AuthState.ts";
import {KeycloakProfile} from "keycloak-js";
import {permissionKeyInToken} from "./OidcService.ts";

export const readAuthState = (state: any) => {
  if (typeof state === 'object' && !Array.isArray(state) && Object.keys(state).includes(authSliceName)) {
    return state[authSliceName] as AuthState;
  } else {
    return getAuthInitialState();
  }
};

export const readIsLoggedIn = (authState: AuthState): boolean => {
  if (!authState || authState.state === undefined) {
    return false;
  }

  if (authState.state.tokenParsed === undefined) {
    return false;
  }

  const now = new Date();
  now.setTime(Date.now());

  return authState.tokenExpirationMillisUTC > now.getTime();
};

export const readUserProfile = (authState: AuthState): KeycloakProfile | undefined => {
  return authState.state?.profile;
};

export const readName = (authState: AuthState) => {
  const userProfile = readUserProfile(authState);
  return userProfile && `${userProfile.firstName} ${userProfile.lastName}`;
}

export const hasAnyPermission = (authState: AuthState, permissions: string[], keyInToken: string = permissionKeyInToken): boolean => {
  if (!permissions || permissions.length < 1) {
    return false;
  }

  if (!authState || !authState.state || !authState.state.tokenParsed) {
    return false;
  }

  const token = authState.state.tokenParsed || {};
  const keys = Object.keys(token);

  if (!keys.includes(keyInToken)) {
    return false;
  }

  const permissionsInToken = token[keyInToken];
  if (!Array.isArray(permissionsInToken)) {
    return false;
  }

  if (!permissionsInToken || permissionsInToken.length < 1) {
    return false;
  }

  return permissions.some(permission => permissionsInToken.indexOf(permission) > -1);
};

export const readUserPermissions = (authState: AuthState, keyInToken: string = permissionKeyInToken) => {
  if (!authState || !authState.state || !authState.state.tokenParsed) {
    return [];
  }

  const token = authState.state.tokenParsed || {};
  const keys = Object.keys(token);

  if (!keys.includes(keyInToken)) {
    return [];
  }

  const permissionsInToken = token[keyInToken];
  if (!Array.isArray(permissionsInToken)) {
    return [`${permissionsInToken}`];
  } else {
    return permissionsInToken as string[];
  }

}
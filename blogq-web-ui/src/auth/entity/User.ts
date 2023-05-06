import {KeycloakProfile, KeycloakTokenParsed} from "keycloak-js";

export interface User {
  subject?: string;
  token?: string;
  tokenParsed?: KeycloakTokenParsed;
  idToken?: string;
  idTokenParsed?: KeycloakTokenParsed;
  profile?: KeycloakProfile;
  userInfo?: {};
}

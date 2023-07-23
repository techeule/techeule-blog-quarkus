import Keycloak from "keycloak-js";
import {User} from "../entity/User.ts";
import {dispatchLogin, dispatchLogout} from "./AuthDispatchers.ts";
import configurationService from "../../configuration/control/ConfigurationService.ts";

const oidcClient = new Keycloak(configurationService.oidcConfiguration);

export class OidcService {
  private _oidcClient: Keycloak;
  private _user: User;

  constructor(keycloak: Keycloak) {
    this._oidcClient = keycloak;
    this._user = {};
  }

  init(callback: () => void) {
    return this.initOidc(callback).then(_r => console.debug(`${this.constructor.name} is initialised`));
  }

  private initOidc(onAuthenticatedCallback: () => any | void): Promise<any | void> {
    return this._oidcClient
      .init(configurationService.oidcInitOptions)
      .then(b => this._loadUserAndDispatchIfLoggedIn(b))
      .catch(e => console.debug(`can not load and dispatch user. Maybe user is not logged in`, e))
      .then(onAuthenticatedCallback)
      .catch(er => console.error(`Unexpected error while initialising ${this.constructor.name}`, er));
  }

  private _loadUser() {
    return Promise.all([this._oidcClient.loadUserInfo(), this._oidcClient.loadUserProfile()])
      .then(data => {
        const user: User = {
          idToken: this._oidcClient.token,
          idTokenParsed: this._oidcClient.idTokenParsed,
          profile: data[1],
          subject: this._oidcClient.subject,
          token: this._oidcClient.token,
          tokenParsed: this._oidcClient.tokenParsed,
          userInfo: data[0]
        };
        this._user = user;
        return user;
      })
  }

  private async _loadUserAndDispatchIfLoggedIn(a: any) {
    try {
      if (this.isLoggedIn()) {
        const user = await this._loadUser();
        if (user) {
          dispatchLogin(user);
        }
      }
    } catch (e) {
      console.log(`got an error during _loadUserAndDispatch`, e);
    }
    return a;
  }

  login() {
    return this._oidcClient.login().then(a => this._loadUserAndDispatchIfLoggedIn(a));
  }

  async getUser() {
    if (this.isLoggedIn()) {
      if (this._user) {
        return this._user;
      }
      return await this._loadUser();
    } else {
      return Promise.reject("Not logged in!")
    }
  }

  isLoggedIn() {
    return !!this._oidcClient.token
  }

  logout() {
    dispatchLogout();
    return this._oidcClient.logout().then(dispatchLogout);
  }

  async withToken<T>(tokenConsumer: (token: string) => Promise<T>): Promise<T> {
    console.debug("with token >> ")

    try {
      await this._oidcClient.updateToken(30);
    } catch (error) {
      console.error('Failed to refresh token:', error);
      throw error;
    }
    return await tokenConsumer(this._oidcClient.token!);
  }

  accountUrl(){
    return this._oidcClient.createAccountUrl()
  }

  register() {
    return this._oidcClient.register();
  }

}

const oidcService = new OidcService(oidcClient);
export const withToken: <T>(consumer: (token: string) => Promise<T>) => Promise<T> = (consumer) => oidcService.withToken(consumer)
export const permissionKeyInToken: string = "groups"
export default oidcService

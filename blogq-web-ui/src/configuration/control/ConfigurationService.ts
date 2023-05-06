import {KeycloakConfig, KeycloakInitOptions} from "keycloak-js";
import {getOidcConfiguration, getOidcInitOptions} from "./OidcConfiguration.ts";
import {appName, appRootUrl, appVersion} from "../entity/app-config.ts";

const holder = {
  data: {
    applicationName: appName(),
    applicationVersion: appVersion(),
    applicationRootUrl: appRootUrl()
  }
};

class ConfigurationService {
  private _oidcConfiguration: KeycloakConfig = getOidcConfiguration();
  private _oidcInitOptions: KeycloakInitOptions = getOidcInitOptions();

  get applicationName() {
    return holder.data.applicationName;
  }

  get applicationVersion() {
    return holder.data.applicationVersion;
  }

  get oidcConfiguration(): KeycloakConfig | string {
    return this._oidcConfiguration
  }

  get oidcInitOptions(): KeycloakInitOptions {
    return this._oidcInitOptions;
  }
}

const configurationService = new ConfigurationService();

export default configurationService
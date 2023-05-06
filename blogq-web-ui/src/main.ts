import "bulma/css/bulma.min.css";
import "./redux/control/ApplicationStore.ts";
import "./ComponentsAndElements.ts";
import oidcService from "./auth/control/OidcService.ts";
import {dispatchLogin} from "./auth/control/AuthDispatchers.ts";
import configurationService from "./configuration/control/ConfigurationService.ts";

const onAuthenticatedCallback = async () => {
  if (oidcService.isLoggedIn()) {
    oidcService.getUser().then(u => dispatchLogin(u));
  }
  await import('./navigation/control/ApplicationRouter.ts');
};

oidcService.init(onAuthenticatedCallback).then(_ => {
  const appInfo = `${configurationService.applicationName} - version ${configurationService.applicationVersion}`;
  console.log(`application (${appInfo}) initialisation completed!`)
});

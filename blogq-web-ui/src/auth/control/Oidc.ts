import Keycloak, {KeycloakConfig} from "keycloak-js";

const keycloakAppConfig = (await (await fetch('/configurations/oidc.json')).json()) as KeycloakConfig

const oidcClient: Keycloak = new Keycloak(keycloakAppConfig);

interface User {
  userInfo?: Object,
  userProfile?: Object

}

const user: User = {}

const loadUser = async () => {
  user.userInfo = await oidcClient.loadUserInfo()
  user.userProfile = await oidcClient.loadUserProfile()
}


const onTokenUpdate = async (_refreshed: boolean) => {
  await loadUser()
}

const doLogin = () => {
  return oidcClient.init({
    useNonce: true,
    onLoad: "login-required"
  }).then(async loggedId => {
    if (loggedId) {
      oidcClient.updateToken(10).then(onTokenUpdate)
      await loadUser()
    } else {
      console.error("can not log in")
    }
    return loggedId
  }).catch(e => {
    console.error(e)
  })
}

const getJwtToken = () => {
  return oidcClient.tokenParsed
}

const isLoggedIn = () => {
  return getJwtToken() !== undefined
}

const getUser = () => user

export {isLoggedIn, doLogin, getJwtToken, getUser}
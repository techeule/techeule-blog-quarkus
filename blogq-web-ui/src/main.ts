import {doLogin, getJwtToken, getUser, isLoggedIn} from "./auth/control/Oidc";

if (!isLoggedIn()) {
  if (await doLogin()) {
    console.log({isLoggedIn: true, jwt: getJwtToken()})
  } else {
    console.log({isLoggedIn: false, jwt: getJwtToken()})
  }
}

console.log(getJwtToken())
console.log(getUser())

document.write(`<h1>Token</h1>`)
document.write(`<code><pre>${JSON.stringify(getJwtToken(), null, 2)}</pre></code>`)

document.write(`<h1>User Info</h1>`)
document.write(`<code><pre>${JSON.stringify(getUser().userInfo, null, 2)}</pre></code>`)

document.write(`<h1>User Profile</h1>`)
document.write(`<code><pre>${JSON.stringify(getUser().userProfile, null, 2)}</pre></code>`)
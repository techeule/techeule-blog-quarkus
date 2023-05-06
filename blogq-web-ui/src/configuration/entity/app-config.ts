// Application Root URL
let _rootUrl = "";
export const appRootUrl = () => {
  return _rootUrl;
}
_rootUrl = window.location.origin; // default (local)

// Application Name
let _appName = "";
export const appName = () => {
  return _appName;
}
_appName = "TechEule - BloqQ Editor"; // default (local)

// Application Name
let _appVersion = "";
export const appVersion = () => {
  return _appVersion;
}
_appVersion = "0.0.0"; // default (local)

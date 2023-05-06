import {AuthState} from "./AuthState.ts";

export const authSliceName: 'authenticationAndAuthorizationSlice' = 'authenticationAndAuthorizationSlice';

const date = new Date();
date.setTime(0);
const utcAt0AsString = date.toUTCString()
export const getAuthInitialState = (): AuthState => ({
  actionState: "Fulfilled",
  state: undefined,
  tokenExpirationMillisUTC: 0,
  tokenExpirationDateUTC: utcAt0AsString
});

import {AuthState} from "./AuthState.ts";
import {authSliceName, getAuthInitialState} from "./AuthConstants.ts";
import {extraReducers} from "../control/AuthApiClient.ts";
import {createSlice, PayloadAction} from "@reduxjs/toolkit";
import {User} from "./User.ts";

const fulfillState = (state: AuthState) => {
  state.actionState = "Fulfilled";
  state.errorMessage = undefined;
  state.tokenExpirationMillisUTC = 0;
  const date = new Date();
  date.setTime(0);
  state.tokenExpirationDateUTC = date.toUTCString()
};

const reducers = {
  login(state: AuthState, payload: PayloadAction<User>) {
    fulfillState(state);
    state.state = payload.payload
    state.tokenExpirationMillisUTC = (state.state?.tokenParsed?.exp || 0) * 1000;
    const date = new Date();
    date.setTime(state.tokenExpirationMillisUTC);
    state.tokenExpirationDateUTC = date.toUTCString();
  },
  logout(state: AuthState) {
    fulfillState(state);
    state.state = undefined;
  },
  clearErrors(state: AuthState) {
    fulfillState(state);
  }
};

const initialState = getAuthInitialState()

const sliceOptions = {
  name: authSliceName,
  initialState,
  reducers,
  extraReducers
};

const authSlice = createSlice(sliceOptions);

export const {logout, clearErrors, login} = authSlice.actions;


export default authSlice.reducer;
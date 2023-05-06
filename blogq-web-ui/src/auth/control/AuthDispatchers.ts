import applicationStore from "../../redux/control/ApplicationStore.ts";
import {User} from "../entity/User.ts";
import {login, logout} from "../entity/AuthStoreSlice.ts";


export const dispatchLogin = (user: User) => {
  applicationStore.dispatch(login(user));
};

export const dispatchLogout = () => {
  applicationStore.dispatch(logout());
};
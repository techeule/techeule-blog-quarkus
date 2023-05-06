import {User} from "./User.ts";
import {ReduxStateHolder} from "../../redux/entity/ReduxStateHolder.ts";

export interface AuthState extends ReduxStateHolder<User> {
  tokenExpirationMillisUTC: number
  tokenExpirationDateUTC: string
}
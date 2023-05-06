import {Router} from "@vaadin/router";
import routes from "./Routes.ts";

const outlet = document.querySelector('#main-application-view');
const applicationRouter = new Router(outlet);
applicationRouter.setRoutes(routes).then(_e => console.debug("router initialized with ", routes));

export default applicationRouter;

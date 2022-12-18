import { Router } from "express";
import { postUrlShorten } from "../controllers/urls.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { urlSchemaValidation} from "../middlewares/urls/urlSchemaValidation.middleware.js"

const urlsRouter = Router();

urlsRouter.post("/urls/shorten", urlSchemaValidation, authValidation, postUrlShorten);

export default urlsRouter;

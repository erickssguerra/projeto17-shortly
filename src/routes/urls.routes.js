import { Router } from "express";
import { postUrlShorten, getUrlById } from "../controllers/urls.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { existingShortUrl } from "../middlewares/urls/urlExistingShortUrl.middleware.js";
import { urlSchemaValidation} from "../middlewares/urls/urlSchemaValidation.middleware.js"


const urlsRouter = Router();

urlsRouter.post("/urls/shorten", urlSchemaValidation, authValidation, postUrlShorten);
urlsRouter.get("/urls/:id", existingShortUrl, getUrlById)

export default urlsRouter;

import { Router } from "express";
import { postUrlShorten } from "../controllers/urls.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten", authValidation, postUrlShorten);

export default urlsRouter;

import { Router } from "express";
import {
  postUrlShorten,
  getUrlById,
  getUrlOpen,
  deleteUrlById,
  getRanking
} from "../controllers/urls.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { existingId } from "../middlewares/urls/urlExistingId.middleware.js";
import { existingShortUrl } from "../middlewares/urls/urlExistingShortUrl.middleware.js";
import { isUserAuthor } from "../middlewares/urls/urlIsUserAuthor.middleware.js";
import { urlSchemaValidation } from "../middlewares/urls/urlSchemaValidation.middleware.js";

const urlsRouter = Router();

urlsRouter.post(
  "/urls/shorten",
  urlSchemaValidation,
  authValidation,
  postUrlShorten
);
urlsRouter.get("/urls/:id", existingId, getUrlById);
urlsRouter.get("/urls/open/:shortUrl", existingShortUrl, getUrlOpen);
urlsRouter.delete(
  "/urls/:id",
  authValidation,
  existingId,
  isUserAuthor,
  deleteUrlById
);
urlsRouter.get("/ranking", getRanking)

export default urlsRouter;

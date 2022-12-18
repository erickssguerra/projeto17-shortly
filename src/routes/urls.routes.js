import { Router } from "express";
import {postUrlShorten} from "../controllers/urls.controllers.js"

const urlsRouter = Router()

urlsRouter.post("/urls/shorten", postUrlShorten)

export default urlsRouter
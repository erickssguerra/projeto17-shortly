import { Router } from "express";
import { postSignIn } from "../controllers/sessions.controllers.js";
import { singInValidation } from "../middlewares/sessions/sessionSignInValidation.middleware.js";

const sessionsRouter = Router()

sessionsRouter.post("/signin", singInValidation, postSignIn)

export default sessionsRouter;
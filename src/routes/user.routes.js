import { Router } from "express";
import { postSignUp } from "../controllers/users.controllers.js";
import { userSchemaValidation } from "../middlewares/users/userSchemaValidation.middleware.js";

const usersRouter = Router();

usersRouter.post("/sign-up", userSchemaValidation, postSignUp);

export default usersRouter;

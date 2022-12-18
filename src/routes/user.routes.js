import { Router } from "express";
import { postSignUp } from "../controllers/users.controllers.js";
import { userSchemaValidation } from "../middlewares/users/userSchemaValidation.middleware.js";
import { existingEmail } from "../middlewares/users/userExistingEmail.middleware.js";

const usersRouter = Router();

usersRouter.post("/signup", userSchemaValidation, existingEmail, postSignUp);

export default usersRouter;

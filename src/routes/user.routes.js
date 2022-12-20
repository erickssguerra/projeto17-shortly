import { Router } from "express";
import { getUsersMe, postSignUp } from "../controllers/users.controllers.js";
import { userSchemaValidation } from "../middlewares/users/userSchemaValidation.middleware.js";
import { existingEmail } from "../middlewares/users/userExistingEmail.middleware.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const usersRouter = Router();

usersRouter.post("/signup", userSchemaValidation, existingEmail, postSignUp);
usersRouter.get("/users/me", authValidation, getUsersMe)


export default usersRouter;

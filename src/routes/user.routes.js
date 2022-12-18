import { Router } from "express";
import { getUsers } from "../controllers/users.controllers.js";

const usersRouter = Router()

usersRouter.get("/users", getUsers);

export default usersRouter;
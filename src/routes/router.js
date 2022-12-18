import { Router } from "express";
import sessionsRouter from "./sessions.routes.js";
import usersRouter from "./user.routes.js";

const router = Router();

router.use(usersRouter);
router.use(sessionsRouter);

export default router;

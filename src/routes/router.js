import { Router } from "express";
import sessionsRouter from "./sessions.routes.js";
import usersRouter from "./user.routes.js";
import urlsRouter from "./urls.routes.js";

const router = Router();

router.use(usersRouter);
router.use(sessionsRouter);
router.use(urlsRouter);

export default router;

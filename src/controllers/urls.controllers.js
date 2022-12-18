import chalk from "chalk";
import connectionDB from "../database/database.js";

export async function postUrlShorten(req, res) {
  const  userId  = res.locals.authorizedUserId;
  const { url } = req.body;
  
  res.status(201).send({ url, userId });
}

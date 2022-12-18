import chalk from "chalk";
import connectionDB from "../database/database.js";

export async function postUrlShorten(req, res) {
  const userId = res.locals.authorizedUserId;
  const url = res.locals.schemaValidatedUrl;

  res.status(201).send({ url, userId });
}

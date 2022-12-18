import chalk from "chalk";
import connectionDB from "../database/database.js";

export async function postSignIn(req, res) {
  const user = res.locals.authorizedUser;
  res.status(200).send(user);
}

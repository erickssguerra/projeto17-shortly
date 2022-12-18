import chalk from "chalk";
import connectionDB from "../database/database.js";

export async function postSignUp(req, res) {
  const userObject = res.locals.schemaValidatedUser;
  try {
    console.log(chalk.green("C: postSignUp completed!"));
    res.status(200).send(userObject);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

import chalk from "chalk";
import connectionDB from "../database/database.js";
import { nanoid as tokenGenerator } from "nanoid";

export async function postSignIn(req, res) {
  const user = res.locals.loggedUser;
  const token = tokenGenerator(50);
  try {
    await connectionDB.query(
      `
    INSERT INTO sessions ("userId", token) VALUES ($1, $2)    
    ;`,
      [user.id, token]
    );
    console.log(chalk.green("C: postSignIn concluded!"));
    res.status(200).send({ token });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

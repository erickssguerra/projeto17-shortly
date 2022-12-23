import chalk from "chalk";
import { nanoid as tokenGenerator } from "nanoid";
import { sessionsRepo } from "../repositories/sessionsRepositories.js";

export async function postSignIn(req, res) {
  const user = res.locals.loggedUser;
  const token = tokenGenerator(50);
  try {
    await sessionsRepo.signIn(user.id, token);
    console.log(chalk.green("C: postSignIn concluded!"));
    res.status(200).send({ token });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

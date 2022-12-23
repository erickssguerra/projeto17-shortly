import chalk from "chalk";
import { hashSync as encrypt } from "bcrypt";
import { usersRepo } from "../repositories/usersRepositories.js";

export async function postSignUp(req, res) {
  const { name, email, password } = res.locals.validatedObject;
  const encryptedPassword = encrypt(password, 10);
  try {
    await usersRepo.signUp(name, email, encryptedPassword);
    console.log(chalk.green("C: postSignUp completed!"));
    res.sendStatus(201);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function getUsersMe(req, res) {
  const userId = res.locals.authorizedUserId;
  try {
    const userMetrics = await usersRepo.usersMe(userId);
    console.log(chalk.green("C: getUsersMe concluded!"));
    res.status(200).send(userMetrics);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

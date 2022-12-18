import chalk from "chalk";
import connectionDB from "../database/database.js";
import { hashSync as encrypt } from "bcrypt";

export async function postSignUp(req, res) {
  const { name, email, password } = res.locals.validatedObject;
  const encryptedPassword = encrypt(password, 10);
  try {
    await connectionDB.query(
      `
    INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3)
    ;`,
      [name, email, encryptedPassword]
    );
    console.log(chalk.green("C: postSignUp completed!"));
    res.sendStatus(201);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}


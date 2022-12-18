import chalk from "chalk";
import connectionDB from "../../database/database.js";
import { compareSync as verify } from "bcrypt";

export async function singInValidation(req, res, next) {
  const { email, password } = req.body;
  try {
    const existingUser = await connectionDB.query(
      `
    SELECT * FROM users WHERE email = $1
    ;`,
      [email]
    );
    if (!existingUser.rowCount) {
      console.log(chalk.red("MW: signInValidation failed!"));
      return res.status(401).send({ message: "Email ou senha inválidos!" });
    }
    const correctPassword = verify(password, existingUser.rows[0].password)
    if (!correctPassword){
        console.log(chalk.red("MW: signInValidation failed!"));
        return res.status(401).send({ message: "Email ou senha inválidos!" }); 
    }
    else {
        delete existingUser.rows[0].password
        console.log(chalk.yellow("MW: signInValidation passed..."))
        res.locals.authorizedUser = existingUser.rows[0]
    }
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
  next()
}

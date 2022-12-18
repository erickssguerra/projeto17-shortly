import chalk from "chalk";
import connectionDB from "../../database/database.js";

export async function existingEmail(req, res, next) {
  const userObject = res.locals.schemaValidatedUser;
  try {
    const existingEmail = await connectionDB.query(
      `
        SELECT * FROM users WHERE email = $1;
      `,
      [userObject.email]
    );
    if (existingEmail.rowCount) {
      console.log(chalk.red("MW: existingEmail failed!"));
      return res.status(409).send({ message: "Email já cadastrado!" });
    } else {
      console.log(chalk.yellow("MW: existingEmail passed..."));
      res.locals.validatedObject = userObject;
    }
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
  next()
}

import connectionDB from "../database/database.js";
import chalk from "chalk";

export async function authValidation(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");
  if (!token) {
    console.log(chalk.red("MW: authValidation failed 1!"));
    return res
      .status(401)
      .send({ message: "Problema na autenticação. Faça login de novo!" });
  }
  try {
    const session = await connectionDB.query(
      `
    SELECT * FROM sessions WHERE token = $1
    ;`,
      [token]
    );
    if (!session.rowCount) {
      console.log(chalk.red("MW: authValidation failed 2!"));
      return res
        .status(401)
        .send({ message: "Problema na autenticação. Faça login de novo!" });
    }
    const user = await connectionDB.query(
      `
    SELECT * FROM users WHERE id = $1
    ;`,
      [session.rows[0].userId]
    );

    if (!user.rowCount) {
      console.log(chalk.red("MW: authValidation failed! 3"));
      return res
        .status(401)
        .send({ message: "Problema na autenticação. Faça login de novo!" });
    }

    delete user.rows[0].password;
    console.log(chalk.yellow("MW: authValidation passed..."));
    
    res.locals.authorizedUserId = user.rows[0].id;
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
  next();
}

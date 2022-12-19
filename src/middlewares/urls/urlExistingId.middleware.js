import chalk from "chalk";
import connectionDB from "../../database/database.js";

export async function existingId(req, res, next) {
  const id = req.params.id;
  try {
    const existingId = await connectionDB.query(
      `SELECT * FROM urls WHERE id = $1;`,
      [id]
    );
    if (!existingId.rowCount) {
      console.log(chalk.red("MW: existingId failed!"));
      return res.status(404).send({ message: "Url não encontrada!" });
    } else {
      console.log(chalk.yellow("MW: existingId passed..."));
      const urlObject = existingId.rows[0]
      res.locals.existingId = urlObject;
    }
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
  next();
}

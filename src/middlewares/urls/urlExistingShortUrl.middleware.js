import chalk from "chalk";
import connectionDB from "../../database/database.js";

export async function existingShortUrl(req, res, next) {
  const shortUrl = req.params.id;
  try {
    const existingShortUrl = await connectionDB.query(
      `SELECT * FROM urls WHERE "shortUrl" = $1;`,
      [shortUrl]
    );
    if (!existingShortUrl.rowCount) {
      console.log(chalk.red("MW: existingShortUrl failed!"));
      return res.status(404).send({ message: "Url não encontrada!" });
    } else {
      console.log(chalk.yellow("MW: existingShortUrl passed..."));
      
      res.locals.existingShortUrl = existingShortUrl.rows[0];
    }
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
  next();
}

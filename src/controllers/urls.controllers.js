import chalk from "chalk";
import connectionDB from "../database/database.js";
import { nanoid as shortenUrlCreator } from "nanoid";

export async function postUrlShorten(req, res) {
  const userId = res.locals.authorizedUserId;
  const url = res.locals.schemaValidatedUrl;
  const shortUrl = shortenUrlCreator(8);
  try {
    await connectionDB.query(
      `INSERT INTO urls ("userId", url, "shortUrl")
       VALUES ($1, $2, $3);`,
      [userId, url, shortUrl]
    );
    console.log(chalk.green("C: postUrlShorten concluded!"));
    res.status(201).send({ shortUrl });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function getUrlById(req, res) {
  const { id, shortUrl, url } = res.locals.existingId;
  console.log(chalk.green("C: getUrlById concluded!"));
  res.status(200).send({ id, shortUrl, url });
}

export async function getUrlOpen(req, res) {
  const { id, url } = res.locals.existingShortUrl;
  try {
    await connectionDB.query(
      `UPDATE urls SET views = views + 1 WHERE id = $1;`,
      [id]
    );
    console.log(chalk.green("C: getUrlOpen concluded!"));
    res.redirect(url);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

export async function deleteUrlById(req, res) {
  const urlId = res.locals.authorizationToDelete
  try {
    await connectionDB.query(`DELETE FROM urls WHERE id = $1;`, [urlId]);
    console.log(chalk.green("C: deleteUserById concluded!"));
    res.status(201).send({ message: "Url apagada com sucesso!" });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

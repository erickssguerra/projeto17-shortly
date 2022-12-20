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

export async function getUsersMe(req, res) {
  const userId = res.locals.authorizedUserId;
  try {
    const getUsersMe = await connectionDB.query(
      `SELECT 
        users.id, 
        users.name,
        SUM("visitCount") AS "visitCount",
        JSON_AGG(
          JSON_BUILD_OBJECT (
            'id', urls.id,
            'shortUrl', urls."shortUrl",
            'url', urls.url,
            'visitCount', urls."visitCount"	
          )
        ) AS "shortenedUrls"
      FROM urls
      JOIN users ON users.id = urls."userId"
      WHERE urls."userId" = $1
      GROUP BY users.id  
      ;`,
      [userId]
    );
    if (!getUsersMe.rowCount) {
      const getUsersMeEmpty = await connectionDB.query(
        `SELECT 
          users.id, 
          users.name, 
          0 AS "visitCount",
          ARRAY[]::TEXT[] as "shortenedUrls"
        FROM users
        WHERE users.id = $1   
        ;`, [userId]);
      console.log(chalk.green("C: getUsersMe concluded!"));
      return res.status(404).send(getUsersMeEmpty.rows[0])
    }
    console.log(chalk.green("C: getUsersMe concluded!"));
    res.status(200).send(getUsersMe.rows[0]);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

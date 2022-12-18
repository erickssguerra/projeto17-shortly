import connectionDB from "../database/database.js";

export async function getUsers(req, res) {
  try {
    const users = await connectionDB.query(`SELECT * FROM users;`);
    res.status(200).send(users.rows);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

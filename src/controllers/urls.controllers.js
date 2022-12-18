import chalk from "chalk";
import connectionDB from "../database/database.js";

export async function postUrlShorten(req, res) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");
  const { url } = req.body;
  res.status(201).send({ token, url });
}

import connectionDB from "../database/database.js";

async function signIn(userId, token) {
  return connectionDB.query(
    `
      INSERT INTO sessions ("userId", token) VALUES ($1, $2)    
      ;`,
    [userId, token]
  );
}

export const sessionsRepository = { signIn };

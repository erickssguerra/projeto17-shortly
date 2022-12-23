import connectionDB from "../database/database.js";

async function urlInsert(userId, url, shortUrl) {
  return connectionDB.query(
    `INSERT INTO urls ("userId", url, "shortUrl")
         VALUES ($1, $2, $3);`,
    [userId, url, shortUrl]
  );
}

async function urlOpen(id) {
  return connectionDB.query(
    `UPDATE urls SET "visitCount" = "visitCount" + 1 WHERE id = $1;`,
    [id]
  );
}

async function urlDelete(urlId) {
  return connectionDB.query(`DELETE FROM urls WHERE id = $1;`, [urlId]);
}

async function urlRanking() {
  const ranking = await connectionDB.query(
    `SELECT 
      users.id,
      users.name,
      COUNT(urls.id) AS "linksCount",
      COALESCE(SUM(urls."visitCount"),0) AS "visitCount"
    FROM users
    LEFT JOIN urls ON users.id = urls."userId"
    GROUP BY users.id
    ORDER BY "visitCount" DESC, "linksCount" DESC
    LIMIT 10
   ;`
  );
  return ranking.rows;
}

export const urlsRepo = { urlInsert, urlOpen, urlDelete, urlRanking };

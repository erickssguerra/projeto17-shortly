import connectionDB from "../database/database.js";

async function signUp(name, email, encryptedPassword) {
  return connectionDB.query(
    ` 
    INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3);`,
    [name, email, encryptedPassword]
  );
}

async function usersMe(userId) {
    
  const userMetrics =  await connectionDB.query(
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
  
  if (!userMetrics.rowCount) {
    const userMetricsEmpty =  await connectionDB.query(
      `SELECT 
        users.id, 
        users.name, 
        0 AS "visitCount",
        ARRAY[]::TEXT[] as "shortenedUrls"
      FROM users
      WHERE users.id = $1   
      ;`,
      [userId]
    );
    console.log(userMetricsEmpty.rows[0])
    return userMetricsEmpty.rows[0];
  }
  return userMetrics.rows[0];
}

export const usersRepositories = { signUp, usersMe };

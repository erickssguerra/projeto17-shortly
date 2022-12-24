# projeto17-shortly
- An API designed for shortening URLs and ranking those more clicked.
<details>
  <summary>
    🛠 Tools and technologies
  </summary>
  
```
- Node.js
- Express
- Postgres
```
  
</details>
<details>
  <summary>
    🗂 Folders organization
  </summary>
  
```
    📂 src
    ├── 📂 controllers
    │   ├── sessions.controllers.js
    │   ├── urls.controllers.js
    │   └── users.controllers.js
    ├── 📂 database
    │   └── database.js
    ├── 📂 middlewares
    │   ├── authValidation.middleware.js
    │   ├── 📂 sessions
    │   │   └── sessionSignInValidation.middleware.js
    │   ├── 📂 urls
    │   │   ├── urlExistingId.middleware.js
    │   │   ├── urlExistingShortUrl.middleware.js
    │   │   ├── urlIsUserAuthor.middleware.js
    │   │   └── urlSchemaValidation.middleware.js
    │   └── 📂 users
    │       ├── userExistingEmail.middleware.js
    │       └── userSchemaValidation.middleware.js
    ├── 📂 repositories
    │   ├── sessionsRepositories.js
    │   ├── urlsRepositories.js
    │   └── usersRepositories.js
    ├── 📂 routes
    │   ├── router.js
    │   ├── sessions.routes.js
    │   ├── urls.routes.js
    │   └── user.routes.js
    ├── 📂 schemas
    │   ├── url.schema.js
    │   └── user.schema.js
    └── server.js
```
  
</details>  

<details>
  <summary>
    🧭 Routes
  </summary> 
  
  - post("/signup")
  
    - send `body` in the format
      
       ```
        {
        "name": "erick",
        "email": "erickssguerra@gmail.com",
        "password": "12345",
        "confirmPassword": "12345"
        }
       ```
  - post("/signin")
  
    - send `body` in the format
      
       ```
        {
        "email": "erickssguerra@gmail.com",
        "password": "12345"
        }
       ```  
  - post("/urls/shorten")
    
    - send an token authorization via `headers`
        ```
          {
          "authorization": "Bearer token"
          }
        ```
  
  
    - send `body` in the format
      
       ```
        {
        "url": "http://www.linkedin.com/in/erickssguerra"
        }
       ```
  - get("/urls/:id")
    
    - send an id via `params`
    - get a `body` object
        ```
          {
          "id": "24",
          "shortUrl": "12%af#",
          "url": "http://www.linkedin.com/in/erickssguerra
          }
        ```
  - get("/urls/open/:shortUrl")
    
    - send a shortUrl via `params`
    - user is redirected to the original Url
  - delete("/urls/:id")
    
    - send an id via `params`
    - send user authorization via `header`
    - erase the `url` from the database
  - get("/users/me")
    
    - send the authorization via `params`
    - get a `body` object
        ```
         {
          "id": 3,
          "name": "Erick",
          "visitCount": 0,
          "shortenedUrls": [
             {
              "id": 28,
              "shortUrl": "Gyk-ov",
              "url": "http://www.linkedin.com/in/erickssguerra",
              "visitCount": 0
            },
            {
              "id": 29,
              "shortUrl": "O7sAt0",
              "url": "https://www.github.com/erickssguerra",
              "visitCount": 0
            }
          ]
        }
        ```
    - get("/ranking")
  
      - get a `body` object limited by the top 10
  
        ```
        [
          {
            "id": 1,
            "name": "Erika",
            "linksCount": "1",
            "visitCount": "10"
          },
          {
            "id": 4,
            "name": "Berg",
            "linksCount": "1",
            "visitCount": "1"
          },
          {
            "id": 3,
            "name": "Erick",
            "linksCount": "2",
            "visitCount": "0"
          }...
        ]
        ```
    
  
</details>

<details>
  <summary>🎁 Features</summary>
 
  - validation of object schemas
  - validation of existing params
  - encrypt password
  - log of each middleware and controllers
  - repositories of Postgres queries
  - one single query priorizing

</details>

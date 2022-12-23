# projeto17-shortly
- **Description:** An API designed for shortening URLs and ranking those more clicked.
### Technologies and Tools
```
- Node.js
- Express
- Postgres
```
<details>
  <summary>
    Folders organization
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

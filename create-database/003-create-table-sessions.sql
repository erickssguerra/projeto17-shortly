CREATE TABLE sessions(
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"token" TEXT NOT NULL
);
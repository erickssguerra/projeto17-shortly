CREATE TABLE urls(
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"url" TEXT NOT NULL,
	"shortUrl" VARCHAR(8) NOT NULL,
	"createdAt" TIMESTAMP DEFAULT NOW () NOT NULL
);
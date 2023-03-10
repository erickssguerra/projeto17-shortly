CREATE DATABASE shortly;

CREATE TABLE users(
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL,
	"createdAt" TIMESTAMP DEFAULT NOW() NOT NULL
);

CREATE TABLE sessions(
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"token" TEXT NOT NULL,
	"createdAt" TIMESTAMP DEFAULT NOW() NOT NULL
);

CREATE TABLE urls(
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),
	"url" TEXT NOT NULL,
	"shortUrl" VARCHAR(8) NOT NULL,
	"visitCount" INTEGER NOT NULL DEFAULT(0),
	"createdAt" TIMESTAMP DEFAULT NOW () NOT NULL
);

ALTER TABLE "users" ADD CONSTRAINT "chk_email0" CHECK ("email" LIKE '%_@__%.__%');

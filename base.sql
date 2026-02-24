--Membuat ERD untuk Authentication Flow
--Implementasi SQL untuk ERD yang sudah dibuat
--Tabel yang dibuat harus memiliki relasi
--Menggunakan auto increment pada setiap tabel
--Menggunakan constraint pada kolom yang memerlukan
--Gunakan generic kolom juga================

DROP TABLE IF EXISTS "sessions" CASCADE;
DROP TABLE IF EXISTS "users" CASCADE;
DROP TABLE IF EXISTS "roles" CASCADE;

CREATE TABLE "roles" (
    "roles_id"          SERIAL PRIMARY KEY,
    "created_at"        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at"        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "name"              VARCHAR(50),
    CONSTRAINT "uq_roles_name"  UNIQUE ("name")
);

CREATE TABLE "users" (
    "users_id"          SERIAL PRIMARY KEY,
    "created_at"        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at"        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "name"              VARCHAR(100),
    "email"             VARCHAR(100),
    "password"          TEXT,
    "roles_id"          INT,
    CONSTRAINT "uq_users_email"  UNIQUE      ("email"),
    CONSTRAINT "fk_users_role"   FOREIGN KEY ("roles_id") REFERENCES "roles"("roles_id")
);

CREATE TABLE "sessions" (
    "sessions_id"       SERIAL PRIMARY KEY,
    "created_at"        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at"        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "users_id"          INT,
    CONSTRAINT "fk_sessions_user" FOREIGN KEY ("users_id") REFERENCES "users"("users_id")
);

INSERT INTO "roles" ("name")
VALUES ('admin');

INSERT INTO "users" ("name", "email", "password", "roles_id")
VALUES 
    ('Adit',  'adit@gmail.com',  '12345', 1),
    ('Aska',  'aska@gmail.com',  '12345', 1),
    ('Anton', 'anton@gmail.com', '12345', 1),
    ('Reza',  'reza@gmail.com',  '12345', 1);

INSERT INTO "sessions" ("users_id")
VALUES (1);

SELECT * FROM "roles";
SELECT * FROM "users";
SELECT * FROM "sessions";
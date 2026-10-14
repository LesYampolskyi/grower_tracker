BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  -- use random v4 uuid as starting point (which has the same variant we need)
  -- then overlay timestamp
  -- then set version 7 by flipping the 2 and 1 bit in the version 4 string
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "plant_storage" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "cultivationDays" bigint NOT NULL,
    "name" text,
    "cropType" text NOT NULL,
    "icon" text NOT NULL,
    "plantedAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "authUserId" uuid,
    "telegramId" uuid
);

-- Indexes
CREATE INDEX "user_profile_auth_user_idx" ON "plant_storage" USING btree ("authUserId");
CREATE INDEX "telegram_profile_profile_idx" ON "plant_storage" USING btree ("telegramId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "plant_storage"
    ADD CONSTRAINT "plant_storage_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "plant_storage"
    ADD CONSTRAINT "plant_storage_fk_1"
    FOREIGN KEY("telegramId")
    REFERENCES "telegram_profile"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR grower_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('grower_tracker', '20261013234140155', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013234140155', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260213194423028', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260213194423028', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();


COMMIT;

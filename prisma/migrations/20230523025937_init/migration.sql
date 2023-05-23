-- CreateTable
CREATE TABLE "users" (
    "user_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lastname1" TEXT NOT NULL,
    "lastname2" TEXT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "birthdate" TIMESTAMP(3) NOT NULL,
    "telephone" TEXT NOT NULL,
    "leader_id" INTEGER NOT NULL,
    "gender_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    "team_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "connections" (
    "connection_id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "friend_id" INTEGER NOT NULL,

    CONSTRAINT "connections_pkey" PRIMARY KEY ("connection_id")
);

-- CreateTable
CREATE TABLE "connection_requests" (
    "connectionRequest_id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "accepted" BOOLEAN NOT NULL,
    "user_id" INTEGER NOT NULL,
    "friend_id" INTEGER NOT NULL,

    CONSTRAINT "connection_requests_pkey" PRIMARY KEY ("connectionRequest_id")
);

-- CreateTable
CREATE TABLE "genders" (
    "gender_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "genders_pkey" PRIMARY KEY ("gender_id")
);

-- CreateTable
CREATE TABLE "roles" (
    "role_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "profiles" (
    "profile_id" SERIAL NOT NULL,
    "description" TEXT,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "profiles_pkey" PRIMARY KEY ("profile_id")
);

-- CreateTable
CREATE TABLE "posts" (
    "post_id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "posts_pkey" PRIMARY KEY ("post_id")
);

-- CreateTable
CREATE TABLE "reactions" (
    "reaction_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "post_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,

    CONSTRAINT "reactions_pkey" PRIMARY KEY ("reaction_id")
);

-- CreateTable
CREATE TABLE "reaction_types" (
    "reaction_type_id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "reaction_types_pkey" PRIMARY KEY ("reaction_type_id")
);

-- CreateTable
CREATE TABLE "comments" (
    "comment_id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "post_id" INTEGER NOT NULL,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id")
);

-- CreateTable
CREATE TABLE "companies" (
    "company_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "area_id" INTEGER NOT NULL,
    "size_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    "logo" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "addresse_id" INTEGER NOT NULL,

    CONSTRAINT "companies_pkey" PRIMARY KEY ("company_id")
);

-- CreateTable
CREATE TABLE "company_types" (
    "company_type_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "company_types_pkey" PRIMARY KEY ("company_type_id")
);

-- CreateTable
CREATE TABLE "company_areas" (
    "area_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "company_areas_pkey" PRIMARY KEY ("area_id")
);

-- CreateTable
CREATE TABLE "company_sizes" (
    "company_size_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "company_sizes_pkey" PRIMARY KEY ("company_size_id")
);

-- CreateTable
CREATE TABLE "addresses" (
    "address_id" SERIAL NOT NULL,
    "street" TEXT NOT NULL,
    "suburb" TEXT NOT NULL,
    "zip_code" TEXT NOT NULL,
    "external" INTEGER NOT NULL,
    "internal" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("address_id")
);

-- CreateTable
CREATE TABLE "countries" (
    "country_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "countries_pkey" PRIMARY KEY ("country_id")
);

-- CreateTable
CREATE TABLE "states" (
    "state_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "country_id" INTEGER NOT NULL,

    CONSTRAINT "states_pkey" PRIMARY KEY ("state_id")
);

-- CreateTable
CREATE TABLE "cities" (
    "city_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "state_id" INTEGER NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("city_id")
);

-- CreateTable
CREATE TABLE "teams" (
    "team_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "company_id" INTEGER NOT NULL,

    CONSTRAINT "teams_pkey" PRIMARY KEY ("team_id")
);

-- CreateTable
CREATE TABLE "softskills" (
    "softskill_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "softskills_pkey" PRIMARY KEY ("softskill_id")
);

-- CreateTable
CREATE TABLE "evaluations" (
    "evaluation_id" SERIAL NOT NULL,
    "evaluating_user_id" INTEGER NOT NULL,
    "evaluated_user_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "result" INTEGER NOT NULL,
    "softskill_id" INTEGER NOT NULL,

    CONSTRAINT "evaluations_pkey" PRIMARY KEY ("evaluation_id")
);

-- CreateTable
CREATE TABLE "messages" (
    "message_id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "sender_user_id" INTEGER NOT NULL,
    "receiver_user_id" INTEGER NOT NULL,

    CONSTRAINT "messages_pkey" PRIMARY KEY ("message_id")
);

-- CreateTable
CREATE TABLE "notifications" (
    "notification_id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "read" BOOLEAN NOT NULL,
    "type_id" INTEGER NOT NULL,
    "sender_user_id" INTEGER NOT NULL,
    "receiver_user_id" INTEGER NOT NULL,

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("notification_id")
);

-- CreateTable
CREATE TABLE "notification_types" (
    "notification_type_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "notification_types_pkey" PRIMARY KEY ("notification_type_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_user_id_key" ON "users"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "connections_connection_id_key" ON "connections"("connection_id");

-- CreateIndex
CREATE UNIQUE INDEX "connection_requests_connectionRequest_id_key" ON "connection_requests"("connectionRequest_id");

-- CreateIndex
CREATE UNIQUE INDEX "genders_gender_id_key" ON "genders"("gender_id");

-- CreateIndex
CREATE UNIQUE INDEX "genders_name_key" ON "genders"("name");

-- CreateIndex
CREATE UNIQUE INDEX "roles_role_id_key" ON "roles"("role_id");

-- CreateIndex
CREATE UNIQUE INDEX "roles_name_key" ON "roles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "profiles_profile_id_key" ON "profiles"("profile_id");

-- CreateIndex
CREATE UNIQUE INDEX "profiles_user_id_key" ON "profiles"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "posts_post_id_key" ON "posts"("post_id");

-- CreateIndex
CREATE UNIQUE INDEX "reactions_reaction_id_key" ON "reactions"("reaction_id");

-- CreateIndex
CREATE UNIQUE INDEX "reaction_types_reaction_type_id_key" ON "reaction_types"("reaction_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "comments_comment_id_key" ON "comments"("comment_id");

-- CreateIndex
CREATE UNIQUE INDEX "companies_company_id_key" ON "companies"("company_id");

-- CreateIndex
CREATE UNIQUE INDEX "company_types_company_type_id_key" ON "company_types"("company_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "company_areas_area_id_key" ON "company_areas"("area_id");

-- CreateIndex
CREATE UNIQUE INDEX "company_sizes_company_size_id_key" ON "company_sizes"("company_size_id");

-- CreateIndex
CREATE UNIQUE INDEX "addresses_address_id_key" ON "addresses"("address_id");

-- CreateIndex
CREATE UNIQUE INDEX "countries_country_id_key" ON "countries"("country_id");

-- CreateIndex
CREATE UNIQUE INDEX "states_state_id_key" ON "states"("state_id");

-- CreateIndex
CREATE UNIQUE INDEX "cities_city_id_key" ON "cities"("city_id");

-- CreateIndex
CREATE UNIQUE INDEX "teams_team_id_key" ON "teams"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "softskills_softskill_id_key" ON "softskills"("softskill_id");

-- CreateIndex
CREATE UNIQUE INDEX "evaluations_evaluation_id_key" ON "evaluations"("evaluation_id");

-- CreateIndex
CREATE UNIQUE INDEX "messages_message_id_key" ON "messages"("message_id");

-- CreateIndex
CREATE UNIQUE INDEX "notifications_notification_id_key" ON "notifications"("notification_id");

-- CreateIndex
CREATE UNIQUE INDEX "notification_types_notification_type_id_key" ON "notification_types"("notification_type_id");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_leader_id_fkey" FOREIGN KEY ("leader_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders"("gender_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("team_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "companies"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "connections" ADD CONSTRAINT "connections_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "connections" ADD CONSTRAINT "connections_friend_id_fkey" FOREIGN KEY ("friend_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "connection_requests" ADD CONSTRAINT "connection_requests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "connection_requests" ADD CONSTRAINT "connection_requests_friend_id_fkey" FOREIGN KEY ("friend_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reactions" ADD CONSTRAINT "reactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reactions" ADD CONSTRAINT "reactions_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reactions" ADD CONSTRAINT "reactions_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "reaction_types"("reaction_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "companies" ADD CONSTRAINT "companies_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "company_areas"("area_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "companies" ADD CONSTRAINT "companies_size_id_fkey" FOREIGN KEY ("size_id") REFERENCES "company_sizes"("company_size_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "companies" ADD CONSTRAINT "companies_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "company_types"("company_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "companies" ADD CONSTRAINT "companies_addresse_id_fkey" FOREIGN KEY ("addresse_id") REFERENCES "addresses"("address_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities"("city_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "states" ADD CONSTRAINT "states_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries"("country_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cities" ADD CONSTRAINT "cities_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states"("state_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teams" ADD CONSTRAINT "teams_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "companies"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_evaluating_user_id_fkey" FOREIGN KEY ("evaluating_user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_evaluated_user_id_fkey" FOREIGN KEY ("evaluated_user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_softskill_id_fkey" FOREIGN KEY ("softskill_id") REFERENCES "softskills"("softskill_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_sender_user_id_fkey" FOREIGN KEY ("sender_user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_receiver_user_id_fkey" FOREIGN KEY ("receiver_user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "notification_types"("notification_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_sender_user_id_fkey" FOREIGN KEY ("sender_user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_receiver_user_id_fkey" FOREIGN KEY ("receiver_user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

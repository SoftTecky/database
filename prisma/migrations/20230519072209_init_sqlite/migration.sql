-- CreateTable
CREATE TABLE "Users" (
    "user_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lastname_1" TEXT NOT NULL,
    "lastname_2" TEXT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "birthdate" TEXT NOT NULL,
    "telephone" INTEGER NOT NULL,
    "gender" TEXT,
    "leader" BOOLEAN NOT NULL,
    "role_id" INTEGER NOT NULL,
    "team_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    CONSTRAINT "Users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "Roles" ("role_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Users_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Teams" ("team_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Users_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Companies" ("company_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Roles" (
    "role_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Profiles" (
    "id_profile" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT,
    "user_id" INTEGER NOT NULL,
    CONSTRAINT "Profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Posts" (
    "post_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "user_id" INTEGER NOT NULL,
    CONSTRAINT "Posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Reactions" (
    "reaction_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "post_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    CONSTRAINT "Reactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Reactions_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "Posts" ("post_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Reactions_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "ReactionTypes" ("reaction_type_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ReactionTypes" (
    "reaction_type_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Comments" (
    "comment_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "user_id" INTEGER NOT NULL,
    "post_id" INTEGER NOT NULL,
    CONSTRAINT "Comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Comments_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "Posts" ("post_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Companies" (
    "company_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "area" TEXT NOT NULL,
    "size_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    "logo" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "addresse_id" INTEGER NOT NULL,
    CONSTRAINT "Companies_size_id_fkey" FOREIGN KEY ("size_id") REFERENCES "CompanySizes" ("company_size_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Companies_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "CompanyTypes" ("company_type_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Companies_addresse_id_fkey" FOREIGN KEY ("addresse_id") REFERENCES "Addresses" ("address_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CompanyTypes" (
    "company_type_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "CompanyAreas" (
    "area_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "CompanySizes" (
    "company_size_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Addresses" (
    "address_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "street" TEXT NOT NULL,
    "zip_code" TEXT NOT NULL,
    "external" INTEGER NOT NULL,
    "internal" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    CONSTRAINT "Addresses_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "City" ("city_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Country" (
    "country_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "State" (
    "state_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "State_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "Country" ("country_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "City" (
    "city_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "state_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "City_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "State" ("state_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Teams" (
    "team_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "company_id" INTEGER NOT NULL,
    CONSTRAINT "Teams_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Companies" ("company_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SoftSkills" (
    "soft_skill_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Evaluations" (
    "evaluation_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "evaluating_user_id" INTEGER NOT NULL,
    "evaluated_user_id" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    "result" INTEGER NOT NULL,
    "soft_skill_id" INTEGER NOT NULL,
    CONSTRAINT "Evaluations_evaluating_user_id_fkey" FOREIGN KEY ("evaluating_user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Evaluations_evaluated_user_id_fkey" FOREIGN KEY ("evaluated_user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Evaluations_soft_skill_id_fkey" FOREIGN KEY ("soft_skill_id") REFERENCES "SoftSkills" ("soft_skill_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Messages" (
    "message_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "sender_user_id" INTEGER NOT NULL,
    "receiver_user_id" INTEGER NOT NULL,
    CONSTRAINT "Messages_sender_user_id_fkey" FOREIGN KEY ("sender_user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Messages_receiver_user_id_fkey" FOREIGN KEY ("receiver_user_id") REFERENCES "Users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_user_id_key" ON "Users"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Roles_role_id_key" ON "Roles"("role_id");

-- CreateIndex
CREATE UNIQUE INDEX "Profiles_id_profile_key" ON "Profiles"("id_profile");

-- CreateIndex
CREATE UNIQUE INDEX "Profiles_user_id_key" ON "Profiles"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Posts_post_id_key" ON "Posts"("post_id");

-- CreateIndex
CREATE UNIQUE INDEX "Posts_user_id_key" ON "Posts"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Reactions_reaction_id_key" ON "Reactions"("reaction_id");

-- CreateIndex
CREATE UNIQUE INDEX "Reactions_user_id_key" ON "Reactions"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Reactions_post_id_key" ON "Reactions"("post_id");

-- CreateIndex
CREATE UNIQUE INDEX "ReactionTypes_reaction_type_id_key" ON "ReactionTypes"("reaction_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "Comments_comment_id_key" ON "Comments"("comment_id");

-- CreateIndex
CREATE UNIQUE INDEX "Comments_user_id_key" ON "Comments"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Comments_post_id_key" ON "Comments"("post_id");

-- CreateIndex
CREATE UNIQUE INDEX "Companies_company_id_key" ON "Companies"("company_id");

-- CreateIndex
CREATE UNIQUE INDEX "CompanyTypes_company_type_id_key" ON "CompanyTypes"("company_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "CompanyAreas_area_id_key" ON "CompanyAreas"("area_id");

-- CreateIndex
CREATE UNIQUE INDEX "CompanySizes_company_size_id_key" ON "CompanySizes"("company_size_id");

-- CreateIndex
CREATE UNIQUE INDEX "Addresses_address_id_key" ON "Addresses"("address_id");

-- CreateIndex
CREATE UNIQUE INDEX "Addresses_city_id_key" ON "Addresses"("city_id");

-- CreateIndex
CREATE UNIQUE INDEX "Country_country_id_key" ON "Country"("country_id");

-- CreateIndex
CREATE UNIQUE INDEX "State_state_id_key" ON "State"("state_id");

-- CreateIndex
CREATE UNIQUE INDEX "City_city_id_key" ON "City"("city_id");

-- CreateIndex
CREATE UNIQUE INDEX "City_state_id_key" ON "City"("state_id");

-- CreateIndex
CREATE UNIQUE INDEX "Teams_team_id_key" ON "Teams"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "Teams_company_id_key" ON "Teams"("company_id");

-- CreateIndex
CREATE UNIQUE INDEX "SoftSkills_soft_skill_id_key" ON "SoftSkills"("soft_skill_id");

-- CreateIndex
CREATE UNIQUE INDEX "Evaluations_evaluation_id_key" ON "Evaluations"("evaluation_id");

-- CreateIndex
CREATE UNIQUE INDEX "Messages_message_id_key" ON "Messages"("message_id");

-- CreateTable
CREATE TABLE "Users" (
    "userId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lastname1" TEXT NOT NULL,
    "lastname2" TEXT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "birthdate" TIMESTAMP(3) NOT NULL,
    "telephone" TEXT NOT NULL,
    "leader" BOOLEAN NOT NULL,
    "genderId" INTEGER NOT NULL,
    "roleId" INTEGER NOT NULL,
    "teamId" INTEGER NOT NULL,
    "companyId" INTEGER NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Connections" (
    "connectionId" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,
    "friendId" INTEGER NOT NULL,

    CONSTRAINT "Connections_pkey" PRIMARY KEY ("connectionId")
);

-- CreateTable
CREATE TABLE "ConnectionRequests" (
    "connectionRequestId" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "accepted" BOOLEAN NOT NULL,
    "userId" INTEGER NOT NULL,
    "friendId" INTEGER NOT NULL,

    CONSTRAINT "ConnectionRequests_pkey" PRIMARY KEY ("connectionRequestId")
);

-- CreateTable
CREATE TABLE "Genders" (
    "genderId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Genders_pkey" PRIMARY KEY ("genderId")
);

-- CreateTable
CREATE TABLE "Roles" (
    "roleId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Roles_pkey" PRIMARY KEY ("roleId")
);

-- CreateTable
CREATE TABLE "Profiles" (
    "profileId" SERIAL NOT NULL,
    "description" TEXT,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Profiles_pkey" PRIMARY KEY ("profileId")
);

-- CreateTable
CREATE TABLE "Posts" (
    "postId" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Posts_pkey" PRIMARY KEY ("postId")
);

-- CreateTable
CREATE TABLE "Reactions" (
    "reactionId" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,

    CONSTRAINT "Reactions_pkey" PRIMARY KEY ("reactionId")
);

-- CreateTable
CREATE TABLE "ReactionTypes" (
    "reactionTypeId" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "ReactionTypes_pkey" PRIMARY KEY ("reactionTypeId")
);

-- CreateTable
CREATE TABLE "Comments" (
    "commentId" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "Comments_pkey" PRIMARY KEY ("commentId")
);

-- CreateTable
CREATE TABLE "Companies" (
    "companyId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "area" TEXT NOT NULL,
    "sizeId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,
    "logo" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "addresseId" INTEGER NOT NULL,

    CONSTRAINT "Companies_pkey" PRIMARY KEY ("companyId")
);

-- CreateTable
CREATE TABLE "CompanyTypes" (
    "companyTypeId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CompanyTypes_pkey" PRIMARY KEY ("companyTypeId")
);

-- CreateTable
CREATE TABLE "CompanyAreas" (
    "areaId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CompanyAreas_pkey" PRIMARY KEY ("areaId")
);

-- CreateTable
CREATE TABLE "CompanySizes" (
    "companySizeId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CompanySizes_pkey" PRIMARY KEY ("companySizeId")
);

-- CreateTable
CREATE TABLE "Addresses" (
    "addressId" SERIAL NOT NULL,
    "street" TEXT NOT NULL,
    "suburb" TEXT NOT NULL,
    "zipCode" TEXT NOT NULL,
    "external" INTEGER NOT NULL,
    "internal" INTEGER NOT NULL,
    "cityId" INTEGER NOT NULL,

    CONSTRAINT "Addresses_pkey" PRIMARY KEY ("addressId")
);

-- CreateTable
CREATE TABLE "Country" (
    "countryId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("countryId")
);

-- CreateTable
CREATE TABLE "State" (
    "stateId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "countryId" INTEGER NOT NULL,

    CONSTRAINT "State_pkey" PRIMARY KEY ("stateId")
);

-- CreateTable
CREATE TABLE "City" (
    "cityId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("cityId")
);

-- CreateTable
CREATE TABLE "Teams" (
    "teamId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,

    CONSTRAINT "Teams_pkey" PRIMARY KEY ("teamId")
);

-- CreateTable
CREATE TABLE "SoftSkills" (
    "softSkillId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "SoftSkills_pkey" PRIMARY KEY ("softSkillId")
);

-- CreateTable
CREATE TABLE "Evaluations" (
    "evaluationId" SERIAL NOT NULL,
    "evaluatingUserId" INTEGER NOT NULL,
    "evaluatedUserId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "result" INTEGER NOT NULL,
    "softSkillId" INTEGER NOT NULL,

    CONSTRAINT "Evaluations_pkey" PRIMARY KEY ("evaluationId")
);

-- CreateTable
CREATE TABLE "Messages" (
    "messageId" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "senderUserId" INTEGER NOT NULL,
    "receiverUserId" INTEGER NOT NULL,

    CONSTRAINT "Messages_pkey" PRIMARY KEY ("messageId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_userId_key" ON "Users"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Connections_connectionId_key" ON "Connections"("connectionId");

-- CreateIndex
CREATE UNIQUE INDEX "ConnectionRequests_connectionRequestId_key" ON "ConnectionRequests"("connectionRequestId");

-- CreateIndex
CREATE UNIQUE INDEX "Genders_genderId_key" ON "Genders"("genderId");

-- CreateIndex
CREATE UNIQUE INDEX "Genders_name_key" ON "Genders"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Roles_roleId_key" ON "Roles"("roleId");

-- CreateIndex
CREATE UNIQUE INDEX "Roles_name_key" ON "Roles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Profiles_profileId_key" ON "Profiles"("profileId");

-- CreateIndex
CREATE UNIQUE INDEX "Profiles_userId_key" ON "Profiles"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Posts_postId_key" ON "Posts"("postId");

-- CreateIndex
CREATE UNIQUE INDEX "Posts_userId_key" ON "Posts"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Reactions_reactionId_key" ON "Reactions"("reactionId");

-- CreateIndex
CREATE UNIQUE INDEX "Reactions_userId_key" ON "Reactions"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Reactions_postId_key" ON "Reactions"("postId");

-- CreateIndex
CREATE UNIQUE INDEX "ReactionTypes_reactionTypeId_key" ON "ReactionTypes"("reactionTypeId");

-- CreateIndex
CREATE UNIQUE INDEX "Comments_commentId_key" ON "Comments"("commentId");

-- CreateIndex
CREATE UNIQUE INDEX "Comments_userId_key" ON "Comments"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Comments_postId_key" ON "Comments"("postId");

-- CreateIndex
CREATE UNIQUE INDEX "Companies_companyId_key" ON "Companies"("companyId");

-- CreateIndex
CREATE UNIQUE INDEX "CompanyTypes_companyTypeId_key" ON "CompanyTypes"("companyTypeId");

-- CreateIndex
CREATE UNIQUE INDEX "CompanyAreas_areaId_key" ON "CompanyAreas"("areaId");

-- CreateIndex
CREATE UNIQUE INDEX "CompanySizes_companySizeId_key" ON "CompanySizes"("companySizeId");

-- CreateIndex
CREATE UNIQUE INDEX "Addresses_addressId_key" ON "Addresses"("addressId");

-- CreateIndex
CREATE UNIQUE INDEX "Addresses_cityId_key" ON "Addresses"("cityId");

-- CreateIndex
CREATE UNIQUE INDEX "Country_countryId_key" ON "Country"("countryId");

-- CreateIndex
CREATE UNIQUE INDEX "State_stateId_key" ON "State"("stateId");

-- CreateIndex
CREATE UNIQUE INDEX "City_cityId_key" ON "City"("cityId");

-- CreateIndex
CREATE UNIQUE INDEX "City_stateId_key" ON "City"("stateId");

-- CreateIndex
CREATE UNIQUE INDEX "Teams_teamId_key" ON "Teams"("teamId");

-- CreateIndex
CREATE UNIQUE INDEX "Teams_companyId_key" ON "Teams"("companyId");

-- CreateIndex
CREATE UNIQUE INDEX "SoftSkills_softSkillId_key" ON "SoftSkills"("softSkillId");

-- CreateIndex
CREATE UNIQUE INDEX "Evaluations_evaluationId_key" ON "Evaluations"("evaluationId");

-- CreateIndex
CREATE UNIQUE INDEX "Messages_messageId_key" ON "Messages"("messageId");

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES "Genders"("genderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Roles"("roleId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Teams"("teamId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Companies"("companyId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Connections" ADD CONSTRAINT "Connections_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Connections" ADD CONSTRAINT "Connections_friendId_fkey" FOREIGN KEY ("friendId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConnectionRequests" ADD CONSTRAINT "ConnectionRequests_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConnectionRequests" ADD CONSTRAINT "ConnectionRequests_friendId_fkey" FOREIGN KEY ("friendId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profiles" ADD CONSTRAINT "Profiles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Posts" ADD CONSTRAINT "Posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reactions" ADD CONSTRAINT "Reactions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reactions" ADD CONSTRAINT "Reactions_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts"("postId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reactions" ADD CONSTRAINT "Reactions_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ReactionTypes"("reactionTypeId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comments" ADD CONSTRAINT "Comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comments" ADD CONSTRAINT "Comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts"("postId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Companies" ADD CONSTRAINT "Companies_sizeId_fkey" FOREIGN KEY ("sizeId") REFERENCES "CompanySizes"("companySizeId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Companies" ADD CONSTRAINT "Companies_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "CompanyTypes"("companyTypeId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Companies" ADD CONSTRAINT "Companies_addresseId_fkey" FOREIGN KEY ("addresseId") REFERENCES "Addresses"("addressId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Addresses" ADD CONSTRAINT "Addresses_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("cityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "State" ADD CONSTRAINT "State_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("countryId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "State"("stateId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teams" ADD CONSTRAINT "Teams_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Companies"("companyId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Evaluations" ADD CONSTRAINT "Evaluations_evaluatingUserId_fkey" FOREIGN KEY ("evaluatingUserId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Evaluations" ADD CONSTRAINT "Evaluations_evaluatedUserId_fkey" FOREIGN KEY ("evaluatedUserId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Evaluations" ADD CONSTRAINT "Evaluations_softSkillId_fkey" FOREIGN KEY ("softSkillId") REFERENCES "SoftSkills"("softSkillId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Messages" ADD CONSTRAINT "Messages_senderUserId_fkey" FOREIGN KEY ("senderUserId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Messages" ADD CONSTRAINT "Messages_receiverUserId_fkey" FOREIGN KEY ("receiverUserId") REFERENCES "Users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

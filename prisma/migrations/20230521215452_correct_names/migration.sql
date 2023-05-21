/*
  Warnings:

  - You are about to drop the `City` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Country` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `State` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Addresses" DROP CONSTRAINT "Addresses_cityId_fkey";

-- DropForeignKey
ALTER TABLE "City" DROP CONSTRAINT "City_stateId_fkey";

-- DropForeignKey
ALTER TABLE "State" DROP CONSTRAINT "State_countryId_fkey";

-- DropTable
DROP TABLE "City";

-- DropTable
DROP TABLE "Country";

-- DropTable
DROP TABLE "State";

-- CreateTable
CREATE TABLE "Countries" (
    "countryId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Countries_pkey" PRIMARY KEY ("countryId")
);

-- CreateTable
CREATE TABLE "States" (
    "stateId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "countryId" INTEGER NOT NULL,

    CONSTRAINT "States_pkey" PRIMARY KEY ("stateId")
);

-- CreateTable
CREATE TABLE "Cities" (
    "cityId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL,

    CONSTRAINT "Cities_pkey" PRIMARY KEY ("cityId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Countries_countryId_key" ON "Countries"("countryId");

-- CreateIndex
CREATE UNIQUE INDEX "States_stateId_key" ON "States"("stateId");

-- CreateIndex
CREATE UNIQUE INDEX "Cities_cityId_key" ON "Cities"("cityId");

-- CreateIndex
CREATE UNIQUE INDEX "Cities_stateId_key" ON "Cities"("stateId");

-- AddForeignKey
ALTER TABLE "Addresses" ADD CONSTRAINT "Addresses_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "Cities"("cityId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "States" ADD CONSTRAINT "States_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Countries"("countryId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cities" ADD CONSTRAINT "Cities_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "States"("stateId") ON DELETE RESTRICT ON UPDATE CASCADE;

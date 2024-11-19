/*
  Warnings:

  - You are about to drop the column `dueDate` on the `Challenge` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Challenge` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `status` on the `Challenge` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "AccountStatus" AS ENUM ('PENDING', 'ACCEPTED', 'REJECTED');

-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ADMIN', 'OWNER', 'USER');

-- CreateEnum
CREATE TYPE "PriceStatus" AS ENUM ('UNUSED', 'USED');

-- CreateEnum
CREATE TYPE "GameStatus" AS ENUM ('PENDING', 'IN_PROGRESS', 'COMPLETED');

-- CreateEnum
CREATE TYPE "ChallengeStatus" AS ENUM ('PENDING', 'IN_PROGRESS', 'PAUSED', 'COMPLETED');

-- CreateEnum
CREATE TYPE "RegistrationStatus" AS ENUM ('PENDING', 'ACCEPTED', 'EXPIRED', 'REJECTED');

-- AlterTable
ALTER TABLE "Challenge" DROP COLUMN "dueDate",
DROP COLUMN "status",
ADD COLUMN     "status" "ChallengeStatus" NOT NULL;

-- CreateTable
CREATE TABLE "ChallengeTimeStamps" (
    "id" TEXT NOT NULL,
    "challengeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modifiedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ChallengeTimeStamps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,
    "accountStatus" "AccountStatus" NOT NULL,
    "channel" TEXT NOT NULL,
    "imageSrc" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Games" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" "GameStatus" NOT NULL,
    "imageSrc" TEXT,
    "price" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Games_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Price" (
    "id" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "status" "PriceStatus" NOT NULL,

    CONSTRAINT "Price_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Registration" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "status" "RegistrationStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modifiedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Registration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dept" (
    "id" TEXT NOT NULL,
    "count" INTEGER NOT NULL,
    "receivingMemberId" TEXT NOT NULL,
    "sendingMemberId" TEXT NOT NULL,

    CONSTRAINT "Dept_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ChallengeToGames" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_name_key" ON "User"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Games_name_key" ON "Games"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_ChallengeToGames_AB_unique" ON "_ChallengeToGames"("A", "B");

-- CreateIndex
CREATE INDEX "_ChallengeToGames_B_index" ON "_ChallengeToGames"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Challenge_name_key" ON "Challenge"("name");

-- AddForeignKey
ALTER TABLE "ChallengeTimeStamps" ADD CONSTRAINT "ChallengeTimeStamps_challengeId_fkey" FOREIGN KEY ("challengeId") REFERENCES "Challenge"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Registration" ADD CONSTRAINT "Registration_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dept" ADD CONSTRAINT "Dept_receivingMemberId_fkey" FOREIGN KEY ("receivingMemberId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dept" ADD CONSTRAINT "Dept_sendingMemberId_fkey" FOREIGN KEY ("sendingMemberId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChallengeToGames" ADD CONSTRAINT "_ChallengeToGames_A_fkey" FOREIGN KEY ("A") REFERENCES "Challenge"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChallengeToGames" ADD CONSTRAINT "_ChallengeToGames_B_fkey" FOREIGN KEY ("B") REFERENCES "Games"("id") ON DELETE CASCADE ON UPDATE CASCADE;

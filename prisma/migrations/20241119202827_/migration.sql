/*
  Warnings:

  - You are about to drop the `Games` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ChallengeToGames` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `Registration` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "_ChallengeToGames" DROP CONSTRAINT "_ChallengeToGames_A_fkey";

-- DropForeignKey
ALTER TABLE "_ChallengeToGames" DROP CONSTRAINT "_ChallengeToGames_B_fkey";

-- AlterTable
ALTER TABLE "Challenge" ALTER COLUMN "status" SET DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "role" SET DEFAULT 'USER',
ALTER COLUMN "accountStatus" SET DEFAULT 'PENDING',
ALTER COLUMN "channel" DROP NOT NULL;

-- DropTable
DROP TABLE "Games";

-- DropTable
DROP TABLE "_ChallengeToGames";

-- CreateTable
CREATE TABLE "Game" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" "GameStatus" NOT NULL DEFAULT 'PENDING',
    "imageSrc" TEXT,
    "priceId" TEXT,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ChallengeToGame" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Game_name_key" ON "Game"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Game_priceId_key" ON "Game"("priceId");

-- CreateIndex
CREATE UNIQUE INDEX "_ChallengeToGame_AB_unique" ON "_ChallengeToGame"("A", "B");

-- CreateIndex
CREATE INDEX "_ChallengeToGame_B_index" ON "_ChallengeToGame"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Registration_userId_key" ON "Registration"("userId");

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_priceId_fkey" FOREIGN KEY ("priceId") REFERENCES "Price"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChallengeToGame" ADD CONSTRAINT "_ChallengeToGame_A_fkey" FOREIGN KEY ("A") REFERENCES "Challenge"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChallengeToGame" ADD CONSTRAINT "_ChallengeToGame_B_fkey" FOREIGN KEY ("B") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

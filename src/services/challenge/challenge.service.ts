import prisma from '@/lib/prisma';

export const createChallenge = async (name: string) => {
    return prisma.challenge.create({
        data: {
            name
        }
    });
};

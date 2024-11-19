import {PrismaClient} from '@prisma/client';

const prisma = new PrismaClient();

export const getUserByEmail = async (email: string) => {
    return prisma.user.findUnique({
        where: {email}
    });
};

export const deleteUser = async (id: string) => {
    return prisma.user.delete({
        where: {id}
    });
};

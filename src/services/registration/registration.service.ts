import prisma from '@/lib/prisma';
import {getCurrentUser} from '@/services/user/user.service';

export const getCurrentUserRegistration = async () => {
    const user = await getCurrentUser();
    return prisma.registration.findUnique({
        where: {userId: user.id}
    });
};

export const deleteRegistration = async (id: string) => {
    return prisma.registration.delete({
        where: {id}
    });
};

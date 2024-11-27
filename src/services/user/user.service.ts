import {deleteRegistration} from '@/services/registration/registration.service';
import prisma from '@/lib/prisma';
import {auth0} from '@/lib/auth0';

export const getCurrentUser = async () => {
    const session = await auth0.getSession();
    if (!session || !session.user.email) {
        throw new Error('No email found in session');
    }

    const user = await getUserByEmail(session.user.email);
    if (!user) {
        throw new Error('User not found');
    }

    return user;
};

export const getUserByEmail = async (email: string) => {
    return prisma.user.findUnique({
        where: {email: email}
    });
};

export const createUser = async (email: string, imageSrc?: string) => {
    return prisma.user.create({
        data: {
            email,
            imageSrc,
            registration: {
                create: {}
            }
        }
    });
};

export const deleteUser = async (id: string) => {
    try {
        await deleteRegistration(id);
    } catch (e) {
        console.log(e);
    }

    return prisma.user.delete({
        where: {id}
    });
};

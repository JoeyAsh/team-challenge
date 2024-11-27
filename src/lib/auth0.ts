import {Auth0Client} from '@auth0/nextjs-auth0/server';
import {redirect} from 'next/navigation';
import {createUser, getUserByEmail} from '@/services/user/user.service';

export const auth0 = new Auth0Client({});

export const handleSession = async () => {
    const session = await auth0.getSession();

    if (!session) {
        redirect('/auth/login');
    }

    if (!session.user.email) {
        throw new Error('No email found in session');
    }

    const user = await getUserByEmail(session.user.email);

    if (!user) {
        const createdUser = await createUser(
            session.user.email,
            session.user.picture
        );

        console.log('User was created:', createdUser);
    }

    return session;
};

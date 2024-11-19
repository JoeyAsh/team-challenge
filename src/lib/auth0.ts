import {Auth0Client} from '@auth0/nextjs-auth0/server';
import {redirect} from 'next/navigation';
import {getUserByEmail} from '@/services/user/user.service';

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
    }

    return session;
};

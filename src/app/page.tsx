import {handleSession} from '@/lib/auth0';

const Home = async () => {
    const session = await handleSession();

    return <div>{session.user.email}</div>;
};

export default Home;

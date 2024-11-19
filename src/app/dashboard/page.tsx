import {auth0} from '@/lib/auth0';

const Dashboard = async () => {
    const session = await auth0.getSession();
    return <div>{session?.user.email}</div>;
};

export default Dashboard;

import {getCurrentUser} from '@/services/user/user.service';

const Home = async () => {
    const user = await getCurrentUser();

    if (user.accountStatus === 'REJECTED') {
        return <div>your account is rejected</div>;
    }

    if (user.accountStatus === 'PENDING') {
        return <div>your account is still pending</div>;
    }

    return (
        <div>
            <div></div>
        </div>
    );
};

export default Home;

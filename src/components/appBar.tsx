import {getCurrentUser} from '@/services/user/user.service';
import Image from 'next/image';
import Link from 'next/link';

export default async function AppBar() {
    const user = await getCurrentUser();

    return (
        <div
            className={
                'w-full py-2 bg-gray-800 flex items-center justify-between'
            }
        >
            <div className={'ml-4'}>Challenge Tool</div>
            <div
                className={
                    'mr-4 flex gap-6 align-middle justify-center items-center'
                }
            >
                {user.role === 'ADMIN' && (
                    <>
                        <Link className={'flex'} href={'/registrations'}>
                            Registrations
                        </Link>
                    </>
                )}
                <button className={'text-white'}>Logout</button>
                <div
                    className={
                        'border-solid border-2 border-gray-600 rounded-full overflow-hidden'
                    }
                >
                    <Image
                        src={user.imageSrc ?? ''}
                        width={50}
                        height={50}
                        alt={user.email ?? ''}
                    />
                </div>
            </div>
        </div>
    );
}

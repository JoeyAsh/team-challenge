import {PropsWithChildren} from 'react';
import AppBar from '@/components/appBar';

export default function HomeTemplate(props: PropsWithChildren) {
    return (
        <div className={'flex flex-col'}>
            <AppBar />
            <div className={'flex-1 p-4'}>{props.children}</div>
        </div>
    );
}

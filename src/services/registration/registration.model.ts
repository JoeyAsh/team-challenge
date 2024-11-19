import {UserDto} from '@/services/user/user.model';

export enum RegistrationStatus {
    PENDING = 'PENDING',
    ACCEPTED = 'ACCEPTED',
    EXPIRED = 'EXPIRED',
    REJECTED = 'REJECTED'
}

export interface RegistrationDto {
    id: string;
    user: UserDto;
    userId: string;
    status: RegistrationStatus;
    createdAt: Date;
    modifiedAt: Date;
}

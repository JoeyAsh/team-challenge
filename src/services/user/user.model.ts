import {RegistrationDto} from '@/services/registration/registration.model';

export enum UserRole {
    ADMIN = 'ADMIN',
    OWNER = 'OWNER',
    USER = 'USER'
}

export enum AccountStatus {
    PENDING = 'PENDING',
    ACCEPTED = 'ACCEPTED',
    REJECTED = 'REJECTED'
}

export interface UserDto {
    id: string;
    email: string;
    name: string;
    role: UserRole;
    accountStatus: AccountStatus;
    channel: string;
    imageSrc?: string;
    registration?: RegistrationDto;
}

export type CreateUserDto = Pick<UserDto, 'email'>;

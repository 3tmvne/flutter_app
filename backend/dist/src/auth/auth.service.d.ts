import { JwtService } from '@nestjs/jwt';
import { UsersService } from '../users/users.service';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';
export declare class AuthService {
    private readonly usersService;
    private readonly jwtService;
    constructor(usersService: UsersService, jwtService: JwtService);
    private createToken;
    register(registerDto: RegisterDto): Promise<{
        accessToken: string;
        user: {
            email: string;
            profil_type: string | null;
            langue_preferee: string | null;
            est_anonyme: boolean;
            region: string | null;
            ville: string | null;
            id: string;
            date_inscription: Date;
            createdAt: Date;
            updatedAt: Date;
        };
    }>;
    login(loginDto: LoginDto): Promise<{
        accessToken: string;
        user: {
            email: string;
            profil_type: string | null;
            langue_preferee: string | null;
            est_anonyme: boolean;
            region: string | null;
            ville: string | null;
            id: string;
            date_inscription: Date;
            createdAt: Date;
            updatedAt: Date;
        };
    }>;
    me(userId: string): Promise<{
        email: string;
        profil_type: string | null;
        langue_preferee: string | null;
        est_anonyme: boolean;
        region: string | null;
        ville: string | null;
        id: string;
        date_inscription: Date;
        createdAt: Date;
        updatedAt: Date;
    }>;
}

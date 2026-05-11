import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';
export declare class AuthController {
    private readonly authService;
    constructor(authService: AuthService);
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
    me(request: {
        user: {
            userId: string;
        };
    }): Promise<{
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

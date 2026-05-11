import { UpdateUserDto } from './dto/update-user.dto';
import { UsersService } from './users.service';
export declare class UsersController {
    private readonly usersService;
    constructor(usersService: UsersService);
    findAll(): Promise<{
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
    }[]>;
    findOne(id: string): Promise<{
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
    update(id: string, updateUserDto: UpdateUserDto): Promise<{
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
    remove(id: string): Promise<{
        deleted: boolean;
    }>;
}

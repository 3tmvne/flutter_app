import { Prisma } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateUserDto } from './dto/update-user.dto';
export declare class UsersService {
    private readonly prisma;
    constructor(prisma: PrismaService);
    private sanitize;
    create(data: Prisma.UtilisateurCreateInput): Promise<{
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
    findByEmail(email: string): Promise<{
        email: string;
        profil_type: string | null;
        langue_preferee: string | null;
        est_anonyme: boolean;
        region: string | null;
        ville: string | null;
        id: string;
        password_hash: string | null;
        date_inscription: Date;
        createdAt: Date;
        updatedAt: Date;
    } | null>;
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

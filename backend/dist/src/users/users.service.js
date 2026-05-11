"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UsersService = void 0;
const common_1 = require("@nestjs/common");
const bcrypt = __importStar(require("bcrypt"));
const prisma_service_1 = require("../prisma/prisma.service");
const userSelect = {
    id: true,
    email: true,
    profil_type: true,
    langue_preferee: true,
    est_anonyme: true,
    region: true,
    ville: true,
    date_inscription: true,
    createdAt: true,
    updatedAt: true,
};
let UsersService = class UsersService {
    prisma;
    constructor(prisma) {
        this.prisma = prisma;
    }
    async sanitize(user) {
        if (!user) {
            return null;
        }
        const { password_hash, ...safeUser } = user;
        return safeUser;
    }
    async create(data) {
        const user = await this.prisma.utilisateur.create({
            data,
            select: userSelect,
        });
        return user;
    }
    async findAll() {
        return this.prisma.utilisateur.findMany({
            select: userSelect,
            orderBy: { createdAt: 'desc' },
        });
    }
    async findOne(id) {
        const user = await this.prisma.utilisateur.findUnique({
            where: { id },
        });
        const safeUser = await this.sanitize(user);
        if (!safeUser) {
            throw new common_1.NotFoundException(`User with id ${id} not found`);
        }
        return safeUser;
    }
    async findByEmail(email) {
        return this.prisma.utilisateur.findUnique({
            where: { email },
        });
    }
    async update(id, updateUserDto) {
        const existingUser = await this.prisma.utilisateur.findUnique({
            where: { id },
        });
        if (!existingUser) {
            throw new common_1.NotFoundException(`User with id ${id} not found`);
        }
        const data = {
            email: updateUserDto.email,
            profil_type: updateUserDto.profil_type,
            langue_preferee: updateUserDto.langue_preferee,
            est_anonyme: updateUserDto.est_anonyme,
            region: updateUserDto.region,
            ville: updateUserDto.ville,
        };
        if (updateUserDto.password) {
            data.password_hash = await bcrypt.hash(updateUserDto.password, 10);
        }
        const user = await this.prisma.utilisateur.update({
            where: { id },
            data,
            select: userSelect,
        });
        return user;
    }
    async remove(id) {
        const user = await this.prisma.utilisateur.findUnique({
            where: { id },
        });
        if (!user) {
            throw new common_1.NotFoundException(`User with id ${id} not found`);
        }
        await this.prisma.utilisateur.delete({
            where: { id },
        });
        return { deleted: true };
    }
};
exports.UsersService = UsersService;
exports.UsersService = UsersService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [prisma_service_1.PrismaService])
], UsersService);
//# sourceMappingURL=users.service.js.map
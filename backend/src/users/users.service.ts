import { Injectable, NotFoundException } from '@nestjs/common';
import { Prisma, Utilisateur } from '@prisma/client';
import * as bcrypt from 'bcrypt';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateUserDto } from './dto/update-user.dto';

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
} satisfies Prisma.UtilisateurSelect;

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  private async sanitize(user: Utilisateur | null) {
    if (!user) {
      return null;
    }

    const { password_hash, ...safeUser } = user;
    return safeUser;
  }

  async create(data: Prisma.UtilisateurCreateInput) {
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

  async findOne(id: string) {
    const user = await this.prisma.utilisateur.findUnique({
      where: { id },
    });

    const safeUser = await this.sanitize(user);

    if (!safeUser) {
      throw new NotFoundException(`User with id ${id} not found`);
    }

    return safeUser;
  }

  async findByEmail(email: string) {
    return this.prisma.utilisateur.findUnique({
      where: { email },
    });
  }

  async update(id: string, updateUserDto: UpdateUserDto) {
    const existingUser = await this.prisma.utilisateur.findUnique({
      where: { id },
    });

    if (!existingUser) {
      throw new NotFoundException(`User with id ${id} not found`);
    }

    const data: Prisma.UtilisateurUpdateInput = {
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

  async remove(id: string) {
    const user = await this.prisma.utilisateur.findUnique({
      where: { id },
    });

    if (!user) {
      throw new NotFoundException(`User with id ${id} not found`);
    }

    await this.prisma.utilisateur.delete({
      where: { id },
    });

    return { deleted: true };
  }
}

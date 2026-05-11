import {
  ConflictException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { UsersService } from '../users/users.service';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';

@Injectable()
export class AuthService {
  constructor(
    private readonly usersService: UsersService,
    private readonly jwtService: JwtService,
  ) {}

  private createToken(user: { id: string; email: string }) {
    return this.jwtService.signAsync({ sub: user.id, email: user.email });
  }

  async register(registerDto: RegisterDto) {
    const existingUser = await this.usersService.findByEmail(registerDto.email);

    if (existingUser) {
      throw new ConflictException('Email already exists');
    }

    const passwordHash = await bcrypt.hash(registerDto.password, 10);

    const user = await this.usersService.create({
      email: registerDto.email,
      password_hash: passwordHash,
      profil_type: registerDto.profil_type,
      langue_preferee: registerDto.langue_preferee,
      est_anonyme: registerDto.est_anonyme ?? false,
      region: registerDto.region,
      ville: registerDto.ville,
    });

    const accessToken = await this.createToken(user);

    return {
      accessToken,
      user,
    };
  }

  async login(loginDto: LoginDto) {
    const user = await this.usersService.findByEmail(loginDto.email);

    if (!user || !user.password_hash) {
      throw new UnauthorizedException('Invalid email or password');
    }

    const passwordMatches = await bcrypt.compare(
      loginDto.password,
      user.password_hash,
    );

    if (!passwordMatches) {
      throw new UnauthorizedException('Invalid email or password');
    }

    const accessToken = await this.createToken(user);

    return {
      accessToken,
      user: await this.usersService.findOne(user.id),
    };
  }

  async me(userId: string) {
    return this.usersService.findOne(userId);
  }
}

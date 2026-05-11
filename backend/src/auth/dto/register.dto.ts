import { IsBoolean, IsEmail, IsOptional, IsString, MinLength } from 'class-validator';

export class RegisterDto {
  @IsEmail()
  email: string;

  @IsString()
  @MinLength(8)
  password: string;

  @IsOptional()
  @IsString()
  profil_type?: string;

  @IsOptional()
  @IsString()
  langue_preferee?: string;

  @IsOptional()
  @IsBoolean()
  est_anonyme?: boolean;

  @IsOptional()
  @IsString()
  region?: string;

  @IsOptional()
  @IsString()
  ville?: string;
}

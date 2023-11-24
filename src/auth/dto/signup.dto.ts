import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsEmail } from 'class-validator';
export class signupDTO {
  @ApiProperty()
  @IsEmail()
  email: string;

  @ApiProperty()
  @IsNotEmpty()
  mat_khau: string;

  @ApiProperty()
  @IsNotEmpty()
  ho_ten: string;

  @ApiProperty()
  @IsNotEmpty()
  tuoi: number;

  @ApiProperty()
  @IsNotEmpty()
  anh_dai_dien: string;
}

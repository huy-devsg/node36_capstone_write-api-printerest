import { ApiProperty } from '@nestjs/swagger';

export class UpdateUserDto {
  @ApiProperty()
  email: string;

  @ApiProperty()
  ho_ten: string;

  @ApiProperty()
  tuoi: number;

  @ApiProperty()
  anh_dai_dien: string;
}

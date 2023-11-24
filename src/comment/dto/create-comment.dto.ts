import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';

export class CreateCommentDto {
  @IsNotEmpty()
  nguoi_dung_id: number;

  @IsNotEmpty()
  @ApiProperty()
  hinh_id: number;

  @IsNotEmpty()
  @ApiProperty()
  ngay_binh_luan: Date = new Date();

  @IsNotEmpty()
  @ApiProperty()
  noi_dung: string;
}

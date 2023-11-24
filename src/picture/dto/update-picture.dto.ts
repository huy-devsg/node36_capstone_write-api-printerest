import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreatePictureDto } from './create-picture.dto';

export class UpdatePictureDto extends PartialType(CreatePictureDto) {
  @ApiProperty()
  pictureName: string;

  @ApiProperty()
  pictureDesc: string;

  nguoi_dung_id: number;

  ten_hinh: string;

  duong_dan: string;

  mo_ta: string;
}

import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { SaveImageService } from './save-image.service';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('Save-Image')
@Controller('api/save-image')
export class SaveImageController {
  constructor(private readonly saveImageService: SaveImageService) {}

  @Get(':pictureId')
  checkImgSaveByPicId(@Param('pictureId') pictureId: number) {
    return this.saveImageService.checkImgSaveByPicId(+pictureId);
  }
}

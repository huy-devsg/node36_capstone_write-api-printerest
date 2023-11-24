import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  UploadedFiles,
  UploadedFile,
  UseInterceptors,
  Request,
  Headers,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { Express } from 'express';
import { PictureService } from './picture.service';
import { CreatePictureDto } from './dto/create-picture.dto';
import { UpdatePictureDto } from './dto/update-picture.dto';
import {
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiHeader,
  ApiOperation,
  ApiParam,
  ApiTags,
} from '@nestjs/swagger';
import { JwtAuthGuard } from 'src/auth/authGuard';
import { diskStorage } from 'multer';
import { getPictureName, setPictureName } from './util/picture-name';
import { IsNotEmpty } from 'class-validator';

@ApiTags('Picture')
@Controller('api/picture')
export class PictureController {
  constructor(private readonly pictureService: PictureService) {}

  @Post('upload-picture/:userId')
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @ApiConsumes('multipart/form-data')
  @ApiBody({
    schema: {
      type: 'object',
      required: ['pictureName', 'pictureDesc'],
      properties: {
        pictureName: { type: 'string' },
        pictureDesc: { type: 'string' },
        file: {
          type: 'string',
          format: 'binary',
        },
      },
    },
  })
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: process.cwd() + '/public/images',
        filename: (req, file, callback) => {
          setPictureName(file.originalname);
          const pictureName = getPictureName();
          callback(null, pictureName);
        },
      }),
    }),
  )
  uploadFile(
    @UploadedFile() file: Express.Multer.File,
    @Body()
    pictureProperty: UpdatePictureDto,

    @Param('userId') userId: number,
  ) {
    const pictureName = getPictureName();
    return this.pictureService.uploadPicture(
      +userId,
      file,
      pictureProperty,
      pictureName,
    );
  }
  @Get()
  getListPictures() {
    return this.pictureService.getListPictures();
  }
  @Get('/detail/:pictureId')
  getDetailPictureById(@Param('pictureId') pictureId: string) {
    return this.pictureService.getDetailPictureById(+pictureId);
  }
  @Get(':pictureName')
  getListPicturesByName(@Param('pictureName') pictureName: string) {
    return this.pictureService.getListPicturesByName(pictureName);
  }

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Delete(':pictureId')
  deletePictureById(@Param('pictureId') pictureId: number) {
    return this.pictureService.deletePictureById(+pictureId);
  }
}

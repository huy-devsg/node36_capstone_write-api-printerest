import { Module } from '@nestjs/common';
import { PictureService } from './picture.service';
import { PictureController } from './picture.controller';
import { MulterModule } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
// import { MulterModule } from '@nestjs/platform-express';
// import { FileUploadService } from './file-upload.service';

@Module({
  controllers: [PictureController],
  providers: [PictureService],
})
export class PictureModule {}

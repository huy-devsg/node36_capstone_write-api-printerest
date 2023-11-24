import { Module } from '@nestjs/common';
import { SaveImageService } from './save-image.service';
import { SaveImageController } from './save-image.controller';

@Module({
  controllers: [SaveImageController],
  providers: [SaveImageService],
})
export class SaveImageModule {}

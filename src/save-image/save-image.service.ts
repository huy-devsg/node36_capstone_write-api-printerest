import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class SaveImageService {
  prisma = new PrismaClient();
  async checkImgSaveByPicId(picId) {
    try {
      const data = await this.prisma.luu_anh.findFirst({
        where: {
          hinh_id: picId,
        },
        include: {
          hinh_anh: true,
        },
      });
      return { data };
    } catch (err) {
      return err;
    }
  }
}

import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class UserService {
  prisma = new PrismaClient();

  async getInfoUser(userId) {
    try {
      const data = await this.prisma.nguoi_dung.findFirst({
        select: {
          nguoi_dung_id: true,
          email: true,
          ho_ten: true,
          tuoi: true,
          anh_dai_dien: true,
        },
        where: {
          nguoi_dung_id: userId,
        },
      });
      return { data };
    } catch (err) {
      throw new UnauthorizedException();
    }
  }
  async getPictureSaveByUserId(userId) {
    try {
      const data = await this.prisma.luu_anh.findMany({
        where: {
          nguoi_dung_id: userId,
        },
        include: {
          hinh_anh: true,
        },
      });

      return { data };
    } catch {}
  }

  async getPictureCreatedByUserId(userId) {
    try {
      const data = await this.prisma.hinh_anh.findMany({
        where: {
          nguoi_dung_id: userId,
        },
      });
      return { data };
    } catch {}
  }
  async updateUserByUserId(userId, inputForm) {
    try {
      const data = await this.prisma.nguoi_dung.update({
        where: {
          nguoi_dung_id: userId,
        },
        data: inputForm,
      });
      return { data };
    } catch (err) {
      throw new Error(err.message);
    }
  }
}

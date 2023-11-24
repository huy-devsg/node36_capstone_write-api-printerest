import { Injectable } from '@nestjs/common';
import { UpdatePictureDto } from './dto/update-picture.dto';
import { PrismaClient } from '@prisma/client';
@Injectable()
export class PictureService {
  prisma = new PrismaClient();
  // upload file picture

  async uploadPicture(
    userId,
    file,
    pictureProperty: UpdatePictureDto,
    pictureUrl,
  ) {
    try {
      pictureUrl = 'images/' + pictureUrl;
      const { pictureName, pictureDesc } = pictureProperty;
      const data = await this.prisma.hinh_anh.create({
        data: {
          nguoi_dung_id: userId,
          ten_hinh: pictureName,
          duong_dan: pictureUrl,
          mo_ta: pictureDesc,
        },
      });
      return { data };
    } catch {
      throw new Error('Failed to upload picture.');
    }
  }

  //GET list Picture
  async getListPictures() {
    const data = await this.prisma.hinh_anh.findMany();
    return { data };
  }

  //GET list Picture by Name

  async getListPicturesByName(name: string) {
    const data = await this.prisma.hinh_anh.findMany({
      where: {
        ten_hinh: name,
      },
    });
    return { data };
  }

  async getDetailPictureById(pictureId: number) {
    try {
      const data = await this.prisma.hinh_anh.findFirst({
        where: {
          hinh_id: pictureId,
        },
        include: {
          nguoi_dung: {
            select: {
              nguoi_dung_id: true,
              ho_ten: true,
              anh_dai_dien: true,
            },
          },
        },
      });
      return { data };
    } catch (err) {
      throw Error('Not Found Picture');
    }
  }
  async deteleForeighKey(hinh_id) {
    const data =
      (await this.prisma.binh_luan.deleteMany({
        where: {
          hinh_id,
        },
      })) &&
      (await this.prisma.luu_anh.deleteMany({
        where: {
          hinh_id,
        },
      }));
    return { data };
  }
  async deletePictureById(id) {
    try {
      this.deteleForeighKey(id);

      const data = await this.prisma.hinh_anh.delete({
        where: {
          hinh_id: id,
        },
      });
      return { data };
    } catch (err) {
      console.error(err);
      throw err;
    }
  }
}

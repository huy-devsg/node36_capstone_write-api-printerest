import { Injectable } from '@nestjs/common';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentDto } from './dto/update-comment.dto';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class CommentService {
  prisma = new PrismaClient();

  async postComment(userId, createCommentDto: CreateCommentDto) {
    try {
      const { hinh_id, ngay_binh_luan, noi_dung } = createCommentDto;
      const parsedDate = new Date(ngay_binh_luan);

      const data = await this.prisma.binh_luan.create({
        data: {
          nguoi_dung_id: userId,
          hinh_id,
          ngay_binh_luan: parsedDate,
          noi_dung,
        },
      });
      return { data };
    } catch (error) {
      return error;
    }
  }

  async getCommentByPicId(id) {
    try {
      const data = await this.prisma.binh_luan.findMany({
        where: {
          hinh_id: id,
        },
        include: {
          hinh_anh: true,
          nguoi_dung: true,
        },
      });
      return { data };
    } catch (err) {
      return err;
    }
  }
}

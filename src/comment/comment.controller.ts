import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
} from '@nestjs/common';
import { CommentService } from './comment.service';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentDto } from './dto/update-comment.dto';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from 'src/auth/authGuard';

@ApiTags('Comment')
@Controller('api/comment')
export class CommentController {
  constructor(private readonly commentService: CommentService) {}

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Post('post-comment/:userId')
  postComment(
    @Param('userId') userId: number,
    @Body() createCommentDto: CreateCommentDto,
  ) {
    return this.commentService.postComment(+userId, createCommentDto);
  }
  @Get(':pictureId')
  getCommentByPicId(@Param('pictureId') pictureId: number) {
    return this.commentService.getCommentByPicId(+pictureId);
  }
  // @Post('post-comment')
  // postComment(@Body())

  // @Get()
  // findAll() {
  //   return this.commentService.findAll();
  // }

  // @Patch(':id')
  // update(@Param('id') id: string, @Body() updateCommentDto: UpdateCommentDto) {
  //   return this.commentService.update(+id, updateCommentDto);
  // }

  // @Delete(':id')
  // remove(@Param('id') id: string) {
  //   return this.commentService.remove(+id);
  // }
}

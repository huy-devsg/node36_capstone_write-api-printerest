import {
  Controller,
  Get,
  Body,
  Patch,
  Param,
  Headers,
  UseGuards,
  Request,
  HttpCode,
  Query,
  Put,
} from '@nestjs/common';
import { UserService } from './user.service';
import { UpdateUserDto } from './dto/update-user.dto';
import { ApiBearerAuth, ApiHeader, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from 'src/auth/authGuard';

@ApiTags('User')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('api/user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get(':userId')
  getInfoUser(@Param('userId') userId: number) {
    return this.userService.getInfoUser(+userId);
  }

  @Get(':userId/picture-save')
  getPictureByUserId(@Param('userId') userId: number) {
    return this.userService.getPictureSaveByUserId(+userId);
  }

  @Get(':userId/picture-created')
  getPictureCreatedByUserId(@Param('userId') userId: number) {
    return this.userService.getPictureCreatedByUserId(+userId);
  }

  @Put(':userId/update')
  updateUserByUserId(
    @Param('userId') userId: number,
    @Body() UpdateUserDto: UpdateUserDto,
  ) {
    return this.userService.updateUserByUserId(+userId, UpdateUserDto);
  }
}

import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { PictureModule } from './picture/picture.module';
import { AuthModule } from './auth/auth.module';
import { CommentModule } from './comment/comment.module';
import { SaveImageModule } from './save-image/save-image.module';
import { ConfigModule } from '@nestjs/config';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from './auth/constants/jwtConstants';
@Module({
  imports: [
    AuthModule,
    UserModule,
    PictureModule,
    SaveImageModule,
    CommentModule,
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    JwtModule.register({
      global: true,
      secret: jwtConstants.secret,
      signOptions: { expiresIn: process.env.EXPIRES_IN },
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

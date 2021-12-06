import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma.service';
import { RetailerService } from './retailer.service';

@Module({
  imports: [],
  controllers: [AppController],
  providers: [AppService, PrismaService, RetailerService],
})
export class AppModule {}

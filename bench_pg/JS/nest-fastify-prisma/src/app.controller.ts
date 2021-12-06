import { Controller, Get, Param } from '@nestjs/common';
import { AppService } from './app.service';
import { RetailerService } from './retailer.service';
import { retailer as RetailerModel } from '@prisma/client';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private readonly retailerService: RetailerService,
  ) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('retailer/:id')
  async getRetailerById(@Param('id') id: string): Promise<RetailerModel> {
    return this.retailerService.retailer({ id: Number(id) });
  }

  @Get('/retailers')
  async getAllRetailers(): Promise<RetailerModel[]> {
    return this.retailerService.retailers({});
  }
}

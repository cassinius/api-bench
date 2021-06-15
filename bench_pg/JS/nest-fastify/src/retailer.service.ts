import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { retailer, Prisma } from '@prisma/client';

@Injectable()
export class RetailerService {
  constructor(private prisma: PrismaService) {}

  async retailer(
    retailerWhereUniqueInput: Prisma.retailerWhereUniqueInput,
  ): Promise<retailer | null> {
    return this.prisma.retailer.findUnique({
      where: retailerWhereUniqueInput,
    });
  }

  async retailers(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.retailerWhereUniqueInput;
    where?: Prisma.retailerWhereUniqueInput;
    orderBy?: Prisma.retailerOrderByInput;
  }): Promise<retailer[]> {
    return this.prisma.retailer.findMany({...params});
  }
}

import { Injectable } from '@nestjs/common';
import { PrismaService } from 'nestjs-prisma';

@Injectable()
export class PostService {
  constructor(private prisma: PrismaService) {}

  async feed(skip = 0, take = 30) {
    return this.prisma.post.findMany({
      take,
      skip,
      orderBy: { createdAt: 'asc' },
    });
  }
}

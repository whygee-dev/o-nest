import { Injectable } from '@nestjs/common';
import { PrismaService } from 'nestjs-prisma';

@Injectable()
export class PostService {
  constructor(private prisma: PrismaService) {}

  async feed(skip = 0, take = 30, search?: string) {
    return this.prisma.post.findMany({
      where: {
        city: { name: { contains: search, mode: 'insensitive' } },
      },
      take,
      skip,
      orderBy: { createdAt: 'asc' },
      include: {
        user: { select: { email: true, profile: true, fullname: true } },
        animal: true,
        address: true,
        city: true,
      },
    });
  }
}

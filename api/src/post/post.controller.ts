import { Controller, Get, Query } from '@nestjs/common';
import { FeedDto } from './dto/Feed.dto';
import { PostService } from './post.service';

@Controller('post')
export class PostController {
  constructor(private postService: PostService) {}

  @Get('/feed')
  async feed(@Query() query: FeedDto) {
    return this.postService.feed(+query.skip, +query.take);
  }
}

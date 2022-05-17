import { IsNumberString, IsOptional, IsString } from 'class-validator';

export class FeedDto {
  @IsOptional()
  @IsNumberString()
  take?: number;

  @IsOptional()
  @IsNumberString()
  skip?: number;

  @IsOptional()
  @IsString()
  search?: string;
}

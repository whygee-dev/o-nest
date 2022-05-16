import { IsNumber, IsNumberString, IsOptional } from 'class-validator';

export class FeedDto {
  @IsOptional()
  @IsNumberString()
  take?: number;

  @IsOptional()
  @IsNumberString()
  skip?: number;
}

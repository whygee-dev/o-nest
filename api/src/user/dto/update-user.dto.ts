import { IsEmail, IsOptional, Length, Matches } from 'class-validator';

export class UpdateUserDto {
  @IsOptional()
  @Matches(
    /(^[A-Za-z]{2,16})([ ]{0,1})([A-Za-z]{2,16})?([ ]{0,1})?([A-Za-z]{2,16})?([ ]{0,1})?([A-Za-z]{2,16})/,
    { message: 'Veuillez renseigner votre nom complete' },
  )
  fullname: string;

  @IsOptional()
  @IsEmail({}, { message: 'Format email invalide' })
  email: string;

  @IsOptional()
  @Length(8, 256, {
    message: 'Le mot de passe doit contenir entre 8 et 256 caractères',
  })
  password: string;
}

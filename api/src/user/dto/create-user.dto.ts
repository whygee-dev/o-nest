import { IsEmail, IsOptional, Length, Matches } from 'class-validator';

export class CreateUserDto {
  @IsOptional()
  @Matches(
    /(^[A-Za-z]{2,16})([ ]{0,1})([A-Za-z]{2,16})?([ ]{0,1})?([A-Za-z]{2,16})?([ ]{0,1})?([A-Za-z]{2,16})/,
    { message: 'Veuillez renseigner votre nom complete' },
  )
  fullname: string;

  @IsEmail({}, { message: 'Format email invalide' })
  email: string;

  @Length(8, 20, {
    message: 'Le mot de passe doit contenir entre 8 et 20 caractères',
  })
  password: string;
}

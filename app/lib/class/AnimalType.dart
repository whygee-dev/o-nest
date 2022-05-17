enum AnimalType { CAT, DOG }

String formatAnimalType(AnimalType type) {
  return type == AnimalType.CAT
      ? "CHAT"
      : type == AnimalType.DOG
          ? "CHIEN"
          : "";
}

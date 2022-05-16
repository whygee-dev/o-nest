import {
  PrismaClient,
  Prisma,
  User,
  Profile,
  Animal,
  City,
  Address,
  Post,
} from '@prisma/client';
// eslint-disable-next-line @typescript-eslint/no-var-requires
const Chance = require('chance');

const chance = new Chance();

const prisma = new PrismaClient();

const savedUsers: (User & {
  posts: Post[];
  profile: Profile;
})[] = [];

const savedAnimals: Animal[] = [];

const savedCities: City[] = [];

const savedAddresses: Address[] = [];

const addressesData: Prisma.AddressCreateInput[] = [
  {
    text: '1 rue de Maroc',
    x: 1.359288,
    y: 44.017397,
  },
  {
    text: 'Traverse Favant',
    x: 5.327092,
    y: 43.361621,
  },
];

const citiesData: Prisma.CityCreateInput[] = [
  {
    name: 'Paris',
    code: 75056,
    x: 2.347,
    y: 48.8589,
  },
  { name: 'Marseille', code: 13055, x: 5.3806, y: 43.2803 },
];

const animalsData: Prisma.AnimalCreateInput[] = [
  {
    age: 6,
    type: 'CAT',
    bio: chance.sentence({ words: 100 }),
    name: 'Yuumi',
  },
  {
    age: 8,
    type: 'DOG',
    bio: chance.sentence({ words: 100 }),
    name: 'Ruffs',
  },
];

const userData: Prisma.UserCreateInput[] = [
  {
    fullname: 'Anne Claire',
    email: 'anneclaire@gmail.com',
    password: '$2a$12$czEO9RE.2MVYAw/ybPx1SepArWqhdAMNkRDMFjDvoFqhp3cksG2z6',
    profile: {
      create: {
        phoneNumber: '0606060606',
        address: {
          connect: { id: 1 },
        },
        city: {
          connect: { code: citiesData[0].code },
        },
        profession: 'Web Developer',
        bio: chance.sentence({ words: 100 }),
      },
    },
    posts: {
      create: [
        {
          description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consectetur rhoncus et sit odio aliquet. Ultrices sem egestas eu magna diam adipiscing lectus nulla consectetur.',
          price: 150.0,
          startDate: new Date(),
          endDate: new Date(
            new Date().getTime() +
              86400 * chance.integer({ min: 0, max: 20 }) * 1000,
          ),
          address: {
            connect: { id: 1 },
          },
          city: {
            connect: { code: citiesData[0].code },
          },
          animal: {
            create: animalsData[0],
          },
        },
      ],
    },
  },
  {
    fullname: 'Antoine Cailloux',
    email: 'antoinecailloux@gmail.com',
    password: '$2a$12$czEO9RE.2MVYAw/ybPx1SepArWqhdAMNkRDMFjDvoFqhp3cksG2z6',
    profile: {
      create: {
        phoneNumber: '0606060606',
        address: {
          connect: { id: 2 },
        },
        city: {
          connect: { code: citiesData[1].code },
        },
        profession: 'UX/UI Designer',
        bio: chance.sentence({ words: 100 }),
      },
    },
    posts: {
      create: [
        {
          description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consectetur rhoncus et sit odio aliquet. Ultrices sem egestas eu magna diam adipiscing lectus nulla consectetur.',
          price: 50.0,
          startDate: new Date(),
          endDate: new Date(
            new Date().getTime() +
              86400 * chance.integer({ min: 0, max: 20 }) * 1000,
          ),
          address: { connect: { id: 2 } },
          city: {
            connect: { code: citiesData[1].code },
          },
          animal: {
            create: animalsData[1],
          },
        },
      ],
    },
  },
];

const seedAddresses = async () => {
  for (const a of addressesData) {
    const address = await prisma.address.create({
      data: a,
    });
    console.log(`Created address with id: ${address.id}`);

    savedAddresses.push(address);
  }
};

const seedCities = async () => {
  for (const c of citiesData) {
    const city = await prisma.city.create({
      data: c,
    });
    console.log(`Created city with code: ${city.code}`);

    savedCities.push(city);
  }
};

const seedUsers = async () => {
  for (const u of userData) {
    const user = await prisma.user.create({
      include: {
        profile: true,
        posts: true,
      },
      data: u,
    });
    console.log(`Created user with id: ${user.id}`);

    const animal = await prisma.animal.update({
      where: { id: user.posts[0].animalId },
      data: { ownerId: user.id },
    });

    console.log(`Updated animal ${animal.id} with owner ${animal.ownerId}`);

    savedUsers.push(user);
  }
};

const seedAnimals = async () => {
  for (const a of animalsData) {
    const animal = await prisma.animal.create({
      data: a,
    });

    console.log(`Created animal with id: ${animal.id}`);

    savedAnimals.push(animal);
  }

  return savedAnimals;
};

const seedPosts = async () => {
  try {
    await prisma.$transaction(async (prisma: PrismaClient) => {
      for (let i = 0; i < 1000; i++) {
        const randUser =
          savedUsers[Math.floor(Math.random() * savedUsers.length)];

        const post = await prisma.post.create({
          data: {
            description: chance.sentence({ words: 100 }),
            price: Math.floor(chance.floating({ min: 50, max: 300 })),
            startDate: new Date(),
            endDate: new Date(
              new Date().getTime() +
                86400 * chance.integer({ min: 0, max: 20 }) * 1000,
            ),
            city: { connect: { id: randUser.profile.cityId } },
            user: { connect: { id: randUser.id } },
            animal: { connect: { id: randUser.posts[0].animalId } },
            address: { connect: { id: randUser.posts[0].addressId } },
          },
        });

        console.log(`Create post with id: ${post.id}`);
      }
    });
  } catch (error) {
    console.log(error);
  }
};

const main = async () => {
  console.log(`Start seeding ...`);

  await seedAddresses();
  await seedCities();
  //await seedAnimals();
  await seedUsers();
  await seedPosts();

  console.log(`Seeding finished.`);
};

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

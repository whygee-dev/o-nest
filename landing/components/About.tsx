import React from "react";
import styles from "./About.module.scss";
import Image from "next/image";
import CardPattern from "./CardPattern";

const cards = [
  {
    title: "La communauté",
    description:
      "Les annonces et les réponses sont faites entre passionnés des chiens et chats. Vous n’avez aucune crainte à avoir pour votre compagnon.",
  },
  {
    title: "Les tarifs",
    description:
      "Les tarifs sont décidés entre particuliers, ce qui permet d’avoir des prix très avantageux. Nous fixons un seuil maximum pour assurer des offres aux utilisateurs ayant un revenu décent.",
  },
  {
    title: "Géolocalisation",
    description:
      "Vous pouvez restreindre vos annnonces à une zone spécifique et ainsi créer votre propre réseau. O’nest vous permet de trouver l’offre appropriée à votre situation géographique.",
  },
];

const Card = ({ title, description }: { title: string; description: string }) => {
  return (
    <div className={styles.card}>
      <h2>{title}</h2>
      <p>{description}</p>
      <CardPattern></CardPattern>
    </div>
  );
};

const About = () => {
  return (
    <div className={styles.about}>
      <div className={styles.responsiveImage}>
        <Image src="/images/mobile-screenshot.png" alt="Mobile screenshot" layout="responsive" width="550" height="875"></Image>
      </div>

      <div className={styles.rightContent}>
        <h1>Pourquoi O’nest ?</h1>

        <div className={styles.cards}>
          {cards.map((c, index) => {
            return <Card key={index} title={c.title} description={c.description} />;
          })}
        </div>
      </div>
    </div>
  );
};

export default About;

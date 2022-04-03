import React from "react";
import styles from "./About.module.scss";
import Image from "next/image";
import CardPattern from "./CardPattern";

const cards = [
  {
    title: "Lorem ipsum",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipselit. Consectetur adipiscing elit.",
  },
  {
    title: "Lorem ipsum",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipselit. Consectetur adipiscing elit.",
  },
  {
    title: "Lorem ipsum",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipselit. Consectetur adipiscing elit.",
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
      <Image src="/images/mobile-screenshot.png" alt="Mobile screenshot" layout="fixed" width="550" height="875"></Image>

      <div className={styles.rightContent}>
        <h1>Lorem ipsum dolor</h1>

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

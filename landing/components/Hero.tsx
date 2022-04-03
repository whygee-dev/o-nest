import React from "react";
import DownloadButtons from "./DownloadButtons";
import Image from "next/image";
import styles from "./Hero.module.scss";

const Hero = () => {
  return (
    <div className={styles.hero}>
      <div className={styles.textContainer}>
        <h1>
          Votre animal <br />
          de compagnie <br />
          accompagné
        </h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nullam dolor bibendum diam urna lacus, in elementum.Lorem ipsum dolor sit
          amet, consectetur adipiscing elit. Vivamus nullam dolor bibendum diam urna lacus, in elementum.
        </p>
        <Image src="/images/down-arrow.png" alt="Down logo" layout="fixed" width="20" height="100" />
        <DownloadButtons></DownloadButtons>
      </div>

      <div className={styles.dogContainer}>
        <Image src="/images/dog.svg" alt="Illustration chien" layout="fixed" width="600" height="450" />
      </div>

      <div className={styles.catContainer}>
        <Image src="/images/cat-pattern.svg" alt="Illustration chat" layout="fixed" width="800" height="965" />
      </div>
    </div>
  );
};

export default Hero;

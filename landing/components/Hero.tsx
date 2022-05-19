import React from "react";
import DownloadButtons from "./DownloadButtons";
import Image from "next/image";
import styles from "./Hero.module.scss";
import { useWindowSize } from "usehooks-ts";

const Hero = () => {
  const { width } = useWindowSize();

  return (
    <div className={styles.hero}>
      <div className={styles.textContainer}>
        <h1>
          Votre animal <br />
          de compagnie <br />
          accompagné
        </h1>
        <p>
          Des vacances d’été ? Un voyage d’affaire urgent ? Mais personne pour garder votre chien ou chat ? Ne vous en faites pas, O’nest a la
          solution pour vous ! Cliquez et résolvez vos problèmes.
        </p>
        <Image src="/images/down-arrow.png" alt="Down logo" layout="fixed" width="20" height="100" />
        <DownloadButtons></DownloadButtons>
      </div>

      <div className={styles.dogContainer}>
        <Image src="/images/dog.svg" alt="Illustration chien" layout="fixed" width="600" height="450" />
      </div>

      <div className={styles.catContainer}>
        {width > 1024 ? (
          <Image src="/images/cat-pattern.svg" alt="Illustration chat" layout="fixed" width="800" height="965" />
        ) : (
          <Image src="/images/cat-pattern.svg" alt="Illustration chat" layout="fixed" width="500" height="665" />
        )}
      </div>
    </div>
  );
};

export default Hero;

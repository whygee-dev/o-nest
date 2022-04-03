import React from "react";
import DownloadButtons from "./DownloadButtons";
import styles from "./Footer.module.scss";
import Image from "next/image";

const Separator = () => <div className={styles.separator}></div>;

const Footer = () => {
  return (
    <footer className={styles.footer}>
      <div className={styles.contact}>
        <Image src="/images/onest-logo.png" alt="O'nest Logo" layout="fixed" width="100" height="81" />

        <div className={styles.text}>
          <h4>Votre animal de compagnie accompagné</h4>

          <p>
            1 rue de Lorraine, 75019 Paris, France
            <br />
            <br />
            + 33 7 28 22 47 22
            <br />
            contact@onset.com
          </p>
        </div>
      </div>
      <Separator></Separator>
      <div className={styles.buttonsContainer}>
        <DownloadButtons></DownloadButtons>
      </div>
      <Separator></Separator>
      <div className={styles.socialMedias}>
        <div className={styles.firstRow}>
          <Image src="/images/instagram.svg" alt="Instagram" layout="fixed" width="72" height="72" />
          <Image src="/images/facebook.svg" alt="Facebook" layout="fixed" width="72" height="72" />
        </div>
        <div className={styles.scdRow}>
          <Image src="/images/tiktok.svg" alt="TikTok" layout="fixed" width="72" height="72" />
          <Image src="/images/linkedin.svg" alt="Linkedin" layout="fixed" width="72" height="72" />
        </div>
      </div>
    </footer>
  );
};

export default Footer;

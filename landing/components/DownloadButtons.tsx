import React from "react";
import styles from "./DownloadButtons.module.scss";
import Image from "next/image";

const DownloadButtons = () => {
  return (
    <div className={styles.downloadButtons}>
      <button className={styles.appleStore}>
        <Image alt="Apple logo" src="/images/apple-logo.png" layout="fixed" width="28" height="28"></Image>
        Download on Apple Store
      </button>
      <button className={styles.playStore}>
        <Image alt="Play store logo" src="/images/playstore-logo.png" layout="fixed" width="28" height="28"></Image>
        Download on Play Store
      </button>
    </div>
  );
};

export default DownloadButtons;

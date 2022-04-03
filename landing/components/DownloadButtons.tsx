import React from "react";
import styles from "./DownloadButtons.module.scss";
import Image from "next/image";
import { useWindowSize } from "usehooks-ts";

type Props = {
  responsive?: boolean;
};

const DownloadButtons = (props: Props) => {
  const { width } = useWindowSize();

  return (
    <div className={`${styles.downloadButtons} ${width <= 1024 && props.responsive ? styles.min : ""}`}>
      <button className={styles.appleStore}>
        <Image alt="Apple logo" src="/images/apple-logo.png" layout="fixed" width="28" height="28"></Image>
        {!props.responsive || width > 1024 ? "Download on Apple Store" : "Apple Store"}
      </button>
      <button className={styles.playStore}>
        <Image alt="Play store logo" src="/images/playstore-logo.png" layout="fixed" width="28" height="28"></Image>
        {!props.responsive || width > 1024 ? "Download on Apple Store" : "Play Store"}
      </button>
    </div>
  );
};

export default DownloadButtons;

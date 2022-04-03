import React from "react";
import Image from "next/image";
import DownloadButtons from "./DownloadButtons";
import styles from "./Header.module.scss";

const Header = () => {
  return (
    <header className={styles.header}>
      <Image src="/images/onest-logo.png" alt="O'nest Logo" layout="fixed" width="80" height="61" />

      <DownloadButtons responsive></DownloadButtons>
    </header>
  );
};

export default Header;

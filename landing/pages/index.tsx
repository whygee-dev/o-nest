import type { NextPage } from "next";
import styles from "../styles/Home.module.scss";

const Home: NextPage = () => {
  return (
    <section className={styles.container}>
      <header></header>

      <main>
        <div className={styles.hero}>
          <h1>Votre animal de companie accompagné</h1>
        </div>
      </main>

      <footer></footer>
    </section>
  );
};

export default Home;

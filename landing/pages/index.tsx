import type { NextPage } from "next";
import About from "../components/About";
import Footer from "../components/Footer";
import Header from "../components/Header";
import Hero from "../components/Hero";
import Testimonials from "../components/Testimonials";
import styles from "./Index.module.scss";

const Home: NextPage = () => {
  return (
    <section className={styles.container}>
      <Header></Header>

      <main>
        <Hero></Hero>
        <About></About>
        <Testimonials></Testimonials>
      </main>

      <Footer></Footer>
    </section>
  );
};

export default Home;

import React from "react";
import styles from "./Testimonials.module.scss";
import Image from "next/image";
import BlobSvg from "./BlobSvg";

const testiomonials = [
  {
    fullname: "Anne Claire",
    role: "Gardienne d'animaux",
    starsCount: 5,
    pdp: "/images/anne-claire.png",
    review: "Lorem ipsum dolor sit amet  ipsum dolor sit amet  ipsum dolor sit amet",
  },
  {
    fullname: "Marie Curie",
    role: "Propriétaire d'un chat",
    starsCount: 5,
    pdp: "/images/marie-curie.png",
    review: "Lorem ipsum dolor sit amet  ipsum dolor sit amet  ipsum dolor sit amet",
  },
  {
    fullname: "Hamza Ali",
    role: "Propriétaire d'un chien",
    starsCount: 5,
    pdp: "/images/hamza-ali.png",
    review: "Lorem ipsum dolor sit amet  ipsum dolor sit amet  ipsum dolor sit amet",
  },
  {
    fullname: "Antoine Mac",
    role: "Gardien d'animaux",
    starsCount: 4,
    pdp: "/images/antoine-mac.png",
    review: "Lorem ipsum dolor sit amet  ipsum dolor sit amet  ipsum dolor sit amet",
  },
];

const Testimonial = ({
  fullname,
  role,
  pdp,
  starsCount,
  review,
}: {
  fullname: string;
  role: string;
  pdp: string;
  starsCount: number;
  review: string;
}) => {
  const stars = Math.max(Math.min(starsCount, 5), 0);

  return (
    <div className={styles.testimonial}>
      <div className={styles.persona}>
        <Image src={pdp} layout="fixed" width="60" height="60" alt={"photo " + fullname}></Image>
        <div>
          <h4>{fullname}</h4>
          <p>{role}</p>
        </div>
      </div>

      <div className={styles.stars}>
        {new Array(stars).fill(null).map((_, index) => {
          return <Image key={index} src="/images/filled-star.png" layout="fixed" width="25" height="25" alt="Etoile rempli" />;
        })}

        {new Array(5 - stars).fill(null).map((_, index) => {
          return <Image key={index} src="/images/empty-star.png" layout="fixed" width="25" height="25" alt="Etoile vide" />;
        })}
      </div>

      <p>{review}</p>
    </div>
  );
};

const Testimonials = () => {
  return (
    <div className={styles.testimonials}>
      <div className={styles.centerTitle}>
        <h1>Ils parlent de nous</h1>
        <BlobSvg></BlobSvg>
      </div>
      {testiomonials.map((t) => {
        return <Testimonial {...t} key={t.fullname} />;
      })}
    </div>
  );
};

export default Testimonials;

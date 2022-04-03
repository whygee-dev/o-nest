const BlobSvg = () => (
  <svg id="sw-js-blob-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" version="1.1">
    <defs>
      <linearGradient id="sw-gradient" x1="0" x2="1" y1="1" y2="0">
        <stop id="stop1" stopColor="rgba(36, 36, 36, 1)" offset="0%"></stop> <stop id="stop2" stopColor="rgba(36, 36, 36, 1)" offset="100%"></stop>{" "}
      </linearGradient>
    </defs>
    <path
      fill="url(#sw-gradient)"
      d="M25.5,-33.4C32.3,-30.3,36.4,-21.7,37.7,-13.3C39,-4.8,37.6,3.5,34.9,11.1C32.1,18.8,28,25.9,22,30.2C16,34.5,8,36.1,1.1,34.6C-5.8,33.1,-11.6,28.6,-18.7,24.6C-25.7,20.6,-34,17.2,-37.8,11C-41.5,4.8,-40.7,-4.1,-38.4,-13C-36.2,-21.8,-32.5,-30.7,-25.8,-33.9C-19.2,-37.1,-9.6,-34.7,-0.1,-34.5C9.4,-34.4,18.8,-36.6,25.5,-33.4Z"
      width="100%"
      height="100%"
      transform="translate(50 50)"
      strokeWidth="0"
      style={{ transition: "all 0.3s ease 0s" }}
      stroke="url(#sw-gradient)"
    ></path>{" "}
  </svg>
);

export default BlobSvg;

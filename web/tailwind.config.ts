import type { Config } from "tailwindcss";

const config = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
    "node_modules/flowbite-react/lib/esm/**/*.js",
  ],
  prefix: "",
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        card: "230px",
        sm: "640px",
        md: "768px",
        lg: "1024px",
        xl: "1280px",
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        blue: "#264fad",
      },
      fontFamily: {
        montserrat: ["Montserrat", "sans-serif"],
        primary: "#264FAD",
        btn: "#264FAD",
        input: "#EFF3F9",
        text: "#434343",
        eye: "#B7B7B7",
        pops: ["Poppins", "sans-serif", "Arial"],
      },
      backgroundImage: {
        "gradient-radial": "radial-gradient(var(--tw-gradient-stops))",
        "gradient-conic": "conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))",
      },
      fontSize: {
        tiny: "0.625rem", // 10px
        huge: "3rem", // 48px
        giant: "5rem", // 80px
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
} satisfies Config;

export default config;

import type { Config } from "tailwindcss";

const config: Config = {
  content: ["./app/**/*.{ts,tsx}", "./components/**/*.{ts,tsx}"],
  theme: {
    extend: {
      colors: {
        bg: "#05100F",
        "bg-deep": "#030B0A",
        teal900: "#0A2A2A",
        teal700: "#123B3C",
        teal500: "#1E5C5A",
        foam: "#EAE6DA",
        "foam-dim": "#B9C4BE",
        aqua: "#7FE7C4",
      },
      fontFamily: {
        display: ["var(--font-display)", "sans-serif"],
        body: ["var(--font-body)", "sans-serif"],
      },
    },
  },
  plugins: [],
};
export default config;

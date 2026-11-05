// Tailwind theme config

if (typeof tailwind === "undefined") {
  console.warn(
    "[SkillBridge] tailwind.config loaded before the CDN script. " +
      "Move <script src='js/tailwind.config.js'> BELOW " +
      "<script src='https://cdn.tailwindcss.com'>."
  );
}

tailwind.config = {
  theme: {
    // `extend` adds to the default theme instead of replacing it
    extend: {
      // Brand colors sampled from assets/images/logo-skillbridge.png
      colors: {
        brand: {
          DEFAULT: "#2d52b4", // primary royal blue (77% of the logo)
          tint: "#f1f2f8", // pale wash — logo tile, active nav pill
          dark: "#284aa5", // hover/pressed state for solid buttons
        },
        navy: "#182b5c", // dark shade / accents (4% of the logo)
      },

      fontFamily: {
        heading: ["Poppins", "sans-serif"],
        body: ["Inter", "sans-serif"],
      },
    },
  },
};
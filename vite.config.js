import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";
import { VitePWA } from "vite-plugin-pwa";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react({
      include: ["**/*.res.mjs"],
    }),
    tailwindcss(),
    // VitePWA({
    //   registerType: "autoUpdate",
    //   manifest: {
    //     name: "Respirit",
    //     short_name: "Respirit",
    //     start_url: "/",
    //     display: "standalone",
    //     background_color: "#ffffff",
    //     theme_color: "#ffffff",
    //     scope: "/",
    //     icons: [{ src: "/logo.svg", type: "image/svg+xml", sizes: "any" }],
    //   },
    //   workbox: {
    //     globPatterns: ["**/*.{js,css,html}"],
    //   },
    // }),
  ],
  build: {
    rollupOptions: {
      output: {
        assetFileNames: (assetInfo) => {
          return `assets/${assetInfo.name}`;
        },
      },
    },
  },
});

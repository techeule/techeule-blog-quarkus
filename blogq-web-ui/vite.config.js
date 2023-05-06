import {defineConfig} from 'vite'
// import dts from 'vite-plugin-dts';

/* https://vitejs.dev/config/ */

export default defineConfig(
  {
    build: { /* https://vitejs.dev/config/build-options.html */
      target: "esnext" /* <== eliminate the error: Top-level await is not available in the configured target environment */
    },
    // plugins: [dts()],
  });

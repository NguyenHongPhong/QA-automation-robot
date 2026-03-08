import { defineConfig } from "playwright/test";
import { WEBSITE_URL } from "./playwright/utils/evnVariables.js";

export default defineConfig({
    use: {
        baseURL: WEBSITE_URL,
        headless: !!process.env.CI,
        viewport: { width: 1280, height: 720 },
        ignoreHTTPSErrors: true,
        video: 'off',
        screenshot: 'only-on-failure',
        launchOptions: {
            slowMo: !!process.env.CI ? 0 : 500,
        },
        trace: 'on-first-retry',
    },
},
    { retries: 2 }
);
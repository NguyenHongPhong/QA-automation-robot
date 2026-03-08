import { type Page } from "@playwright/test";
import { WEBSITE_URL } from "../utils/evnVariables.js";
export class LoginPage {
    constructor(private page: Page) { }

    async goto() {
        console.log("process.env.WEBSITE_URL:", process.env.WEBSITE_URL);

        await this.page.goto(`${WEBSITE_URL}/login`);
    }

    async login(locatorUser: string, locatorPassword: string, locatorLoginButton: string, username: string, password: string) {
        await this.page.fill(locatorUser, username);
        await this.page.fill(locatorPassword, password);

        await Promise.all([
            this.page.waitForURL(WEBSITE_URL),
            await this.page.click(locatorLoginButton)
        ]);
    }
}

import { test as base } from '@playwright/test';

export const test = base.extend({
    page: async ({ page }, use) => {

        await page.route('**/doubleclick.net/**', route => route.abort());
        await page.route('**/googlesyndication.com/**', route => route.abort());

        await use(page);
    }
});
import { type Page } from "@playwright/test";

export class AddToCartPage {
    private page: Page;
    constructor(page: Page) {
        this.page = page;
    };

    async chooseCategory(locatorCategory: string) {
        const category = this.page.locator(locatorCategory);
        await category.scrollIntoViewIfNeeded();
        await Promise.all([
            category.click({ force: true }),
        ]);
    }

    async selectItem(locatorItem: string) {
        const product = this.page.locator(locatorItem).first();
        await product.scrollIntoViewIfNeeded();
        await product.hover();
        await product.click({ force: true });

    }

}
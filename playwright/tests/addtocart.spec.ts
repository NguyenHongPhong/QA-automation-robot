import { test, expect } from '@playwright/test';
import { LoginPage } from '../pages/LoginPage.js';
import {
  LOGIN_EMAIL_INPUT, LOGIN_PASSWORD_INPUT, LOGIN_BUTTON, HOMEPAGE_WOMEN_CATEGORY_LINK,
  ADD_TO_CART_DRESS_ITEM, ADD_TO_CART_SLEEVES_DRESS_ITEM, ADD_TO_CART_SUMMER_WHITE_TOP_ITEM,
  ADD_TO_CART_BEAUTIFUL_PEAQUICK_BLUE_COTTON_LINEN_SAREE_ITEM, ADD_TO_CART_CONTINUE_SHOPPING_BUTTON,
  ADD_TO_CART_TOPS_ITEM,
  ADD_TO_CART_SAREE_ITEM
} from '../utils/locatorVariables.js';
import { VALID_EMAIL, VALID_PASSWORD } from '../utils/evnVariables.js';
import { AddToCartPage } from '../pages/AddToCartPage.js';

test('Add To Cart With 3 Products In Women Category Should Has Three Products In Cart', async ({ page }) => {
  const loginPage = new LoginPage(page);
  const addToCartPage = new AddToCartPage(page);

  await test.step('Open Website And Login', async () => {
    await loginPage.goto();
    await loginPage.login(LOGIN_EMAIL_INPUT, LOGIN_PASSWORD_INPUT, LOGIN_BUTTON, VALID_EMAIL, VALID_PASSWORD.toString());
  });

  await test.step('Choose Women Category', async () => {
    await addToCartPage.chooseCategory(HOMEPAGE_WOMEN_CATEGORY_LINK);
  });

  await test.step('Select Dress Item', async () => {
    await addToCartPage.selectItem(ADD_TO_CART_DRESS_ITEM);
  });

  await test.step('Select Sleeves Dress Item', async () => {
    await addToCartPage.selectItem(ADD_TO_CART_SLEEVES_DRESS_ITEM);
  });

  await page.locator('#cartModal').waitFor({ state: 'visible' });

  await test.step('Continue Shopping', async () => {
    await page.getByRole('button', { name: ADD_TO_CART_CONTINUE_SHOPPING_BUTTON }).click();
  });

  await test.step('Choose Women Category', async () => {
    await addToCartPage.chooseCategory(HOMEPAGE_WOMEN_CATEGORY_LINK);
  });

  await test.step('Select Top Item', async () => {
    await addToCartPage.selectItem(ADD_TO_CART_TOPS_ITEM);
  });

  await test.step('Select Summer White Top Item', async () => {
    await addToCartPage.selectItem(ADD_TO_CART_SUMMER_WHITE_TOP_ITEM);
  });

  await page.locator('#cartModal').waitFor({ state: 'visible' });

  await test.step('Continue Shopping second time', async () => {
    await page.getByRole('button', { name: ADD_TO_CART_CONTINUE_SHOPPING_BUTTON }).click();
  });

  await test.step('Choose Women Category', async () => {
    await addToCartPage.chooseCategory(HOMEPAGE_WOMEN_CATEGORY_LINK);
  });

  await test.step('Select Saree Item', async () => {
    await addToCartPage.selectItem(ADD_TO_CART_SAREE_ITEM);
  });

  await test.step('Select Beautiful Peaquick Blue Cotton Linen Saree Item', async () => {
    await addToCartPage.selectItem(ADD_TO_CART_BEAUTIFUL_PEAQUICK_BLUE_COTTON_LINEN_SAREE_ITEM);
  });
});


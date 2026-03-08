import { loadYaml } from './yamlReader.js';

const env = loadYaml('env_dev');

export const WEBSITE_URL = process.env.WEBSITE_URL || env.WEBSITE_URL;
export const VALID_EMAIL = process.env.VALID_EMAIL || env.VALID_EMAIL;
export const VALID_PASSWORD = process.env.VALID_PASSWORD || env.VALID_PASSWORD;
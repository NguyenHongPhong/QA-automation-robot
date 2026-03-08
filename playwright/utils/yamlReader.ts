import fs from 'fs';
import path from 'path';
import YAML from 'yaml';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export function loadYaml(fileName: string) {
    if (process.env.CI && fileName === 'env_dev') {
        fileName = `${fileName}.env`;
    } else if (!process.env.CI && fileName === 'env_dev') {
        fileName = `${fileName}.yaml`;
    } else {
        fileName = `${fileName}.yaml`;
    }
    const filePath = path.resolve(process.cwd(), `variables/${fileName}`);
    const file = fs.readFileSync(filePath, 'utf8');
    return YAML.parse(file);
}
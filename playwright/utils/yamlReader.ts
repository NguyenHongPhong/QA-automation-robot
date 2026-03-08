import fs from 'fs';
import path from 'path';
import YAML from 'yaml';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export function loadYaml(fileName: string) {
    const filePath = path.resolve(process.cwd(), `variables/${fileName}.yaml`);
    const file = fs.readFileSync(filePath, 'utf8');
    return YAML.parse(file);
}
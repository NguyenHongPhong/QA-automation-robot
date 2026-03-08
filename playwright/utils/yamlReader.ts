import fs from 'fs';
import path from 'path';
import YAML from 'yaml';

export function loadYaml(fileName: string) {
    const filePath = path.resolve(process.cwd(), `variables/${fileName}.yaml`);
    const file = fs.readFileSync(filePath, 'utf8');
    return YAML.parse(file);
}
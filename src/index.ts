import * as core from '@actions/core';
import * as fs from 'fs';

async function run() {
  try {
    // Nome do arquivo necessário
    const filePath = core.getInput('file-path', { required: true });

    // Verifica se o arquivo existe
    if (!fs.existsSync(filePath)) {
      throw new Error(`O arquivo necessário não foi encontrado: ${filePath}`);
    }

    console.log(`O arquivo ${filePath} foi encontrado e está disponível.`);
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
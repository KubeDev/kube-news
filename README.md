Projeto Santander

Tarefa: Crie um pipeline de CI/CD usando o GitHub Actions para um projeto simples de 
aplicação web.

Neste projeto eu utilizei o cluster kubernetes da cloud.digitalocean e configurei o secrets K8S_CONFIG para receber o seu arquivo config.

*****************************************************************************************************************************************************

Tarefa: Crie um pipeline de CI/CD usando o GitHub Actions para um projeto simples de 
aplicação web.
Requisitos:
1. O pipeline deve ser ativado sempre que um novo commit for feito na branch main. ✔

2. O pipeline deve executar os seguintes passos: ✔
o Instalar as dependências do projeto.
o Executar testes unitários.
o Construir a aplicação.
o Armazenar o artefato como release do github
o Usar funcionalidade environment do github para restringir a aprovação do 
deploy para um usuário ou grupo do github

3. Se todos os passos acima forem bem-sucedidos, o pipeline deve fazer o deploy da 
aplicação em um ambiente de teste. ✔

4. O pipeline deve notificar o desenvolvedor via e-mail se o processo de CI/CD falhar em qualquer etapa e no final quando finalizar. ✔

Plus(Não obrigatório porem será um diferencial):
• Criar um desenho simples de arquitetura na ferramenta draw.io (diagrams.net) que 
mostre como sera estruturado o pipeline.
o Critérios:
§ No desenho deve estar descritos claramente a separação dos steps de 
CI e de CD
§ Caso haja alguma interação manual isso deve estar declarado no 
Desenho
• Criar uma action do tipo TypeScript que faça execução de algum linter ou quality 
gates
o Exemplos:
§ Validar se existe um arquivo no repositório necessário para o build,
caso negativo abortar a esteira indicando que e necessário esse 
arquivo
§ Executar uma análise estática usando a ferramenta SonarQube ou 
alguma outra similiar
§ Etc...

Critérios de Avaliação:
1. Correção: O pipeline deve funcionar conforme especificado nos requisitos.
2. Compreensão: O candidato deve ser capaz de explicar como o pipeline funciona e por 
que ele configurou as coisas da maneira que fez. (Será avaliado na entrevista)
3. Eficiência: O pipeline deve ser configurado de maneira eficiente, sem etapas 
desnecessárias.
4. Boas práticas: O pipeline deve seguir as boas práticas do GitHub Actions, como o uso 
de segredos para armazenar informações sensíveis.
5. O Repositório do github com a implementação do pipeline deve ser enviado aos 
entrevistadores no prazo indicado.

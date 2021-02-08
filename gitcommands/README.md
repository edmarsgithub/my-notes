# Comandos GIT

## Introdução

O **GIT** é um sistema de controle de versões de arquivos distribuído. A ideia do **GIT** é permitir o gerenciamento das versões de arquivos em um projeto, de forma que várias pessoas possam colaborar, criar, atualizar e/ou excluir arquivos no projeto sem que ocorram conflitos dessas versões.

O **GITHUB** é um serviço do tipo **SAAS** que aceita o versionamento de arquivos pelo **GIT**.

Na sequência segue alguns passos resumidos para gerenciar um projeto usando o **GIT/GITHUB**.

## Passos para usar o GIT/GITHUB

1. Crie uma conta no **GITHUB** (https://github.com/) e defina seu perfil;

2. Crie um repositório e defina uma descrição.  Sugestão para o nome do repositório: 

   Nome:  `projeto01`

   Descrição: `Repositório de testes do GIT/GITHUB`

3. Veja que ao criar esse repositório o **GITHUB** mostra para você qual é a **URL** desse repositório. Será algo parecido com:

   * `https://github.com/<<seu-user-name>>/<<nome-do-seu-repositorio>>.git`

4. Além disso, por padrão, o **GITHUB** associará seu repositório ao *branch* (ramificação) principal de versionamento, chamado de **master**. Mais adiante você verá que é nesse *branch master* que iremos submeter seus arquivos para o versionamento primário.

5. Para cada repositório haverá uma **URL** diferente. Guarde essa **URL** pois quando for fazer versionamento, essa **URL** deverá ser fornecida mais adiante.

6. No computador, instale o **GIT** (https://git-scm.com/).

7. No local onde deseja versionar seu projeto, crie uma pasta que conterá todos os arquivos do seu projeto. Você poderá copiá-los para essa pasta agora para iniciar o versionamento ou criar arquivos a partir do zero. 

8. Clique com o botão direito do mouse sobre a pasta que deseja versionar e escolha `Git Bash Here`. Isto abrirá uma tela de console `bash` que permitirá a execução dos comandos **GIT** exatamente dentro da pasta que selecionou.

9. Use o comando:

   * `git init` isso inicializará o **GIT** e criará toda estrutura para controle de versão especificamente nessa pasta. 

10. Agora você já pode criar, atualizar, excluir arquivos do seu projeto conforme usas necessidades. 

11. Após cada etapa de progresso do seu projeto, será necessário acionar o **GIT** para incluir, excluir ou atualizar seus arquivos no versionamento. Para isso, use o comando:

    * `git add *` ou `git add .` 

12. O **GIT** fará o rastreamento da sua pasta de trabalho. Toda vez que há uma atualização na pasta referentes à inclusão, alteração ou exclusão de arquivos o **GIT** sabe disso e te indicará quando acionar o comando:

    * `git status`

13. Para indicar ao **GIT** que seus arquivos já estão prontos para o versionamento, você deverá acionar o comando:

    * `git commit -m "descrição motivo do seu versionamento"`

14. Uma vez que seus arquivos já tenham sido _marcados_ para o versionamento, já é possível associá-los ao seu repositório. Para isso será necessário definir um *"apelido"* para a **URL** que definiu ao início do processo. Para isso é sugerido o apelido **origin** no comando:

    * `git remote add origin https://github.com/<<seu-user-name>>/<<nome-do-seu-repositorio>>.git`

15. É possível verificar como ficou associado o apelido à URL basta executar o comando:

    * `git remote -v`

16. Após esse comando, seu repositório local já pode ser enviado ao **GITHUB** para o arquivamento dessa versão. 

17. Agora, o conteúdo de arquivos que estão no **origin** serão oficialmente transferidos para seu repositório remoto na ramificação **master** do **GITHUB**. Para isso, use o comando:

    * `git push -u origin master`

18.  Se tudo ocorreu certo, agora você já tem seu código em um repositório remoto e já pode começar a versionar seu código a cada nova inclusão, modificação ou exclusão feita e seus arquivos.

**Good luck!**
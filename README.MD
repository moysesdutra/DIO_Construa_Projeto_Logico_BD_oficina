# Bem vindo ao projeto de  Modelagem EER para uma aplicação de *Oficina de reparos automotivos*.

Nesse projeto desafio proposto pela DIO foi feito uma modelagem do BD com EER, foi criado o esquema lógico para o contexto de uma oficina. Foi realizada um levantamento de requisitos do cliente para a aplicação, foram constituídas as entidades que fazem a persistência dos dados da aplicação. Todos os relacionamentos foram estruturados. Para a elaboração do diagrama EER foi utilizado o *MySql Workbench*.
As chaves primárias e estrangeiras também foram definidas durante a construção do diagrama.
Todos esses estudos foram feitos seguindo a trilha **Construa um Projeto Lógico de Banco de Dados do Zero** do *bootcamp* **UNIMED BH :green_heart: com a DIO :muscle:** apresentado pela **Juliana Mascarenhas**.

# Arquivos e pastas

Esse estudo foi estruturado da seguinte forma:

:file_folder: **Modelos**: contém os arquivos usados no desafio que consistiu na construção de um modelo EER para um sistema de *Ordens de serviço para uma oficina automotiva* guiado pela instrutora **Juliana Mascarenhas**.

 - Arquivo criando no MySQL Workbench: **OficinaV2.mwb**
 -  Arquivo exportado do MySQL Workbench: **OficinaCompleta.png** (caso não tenha o software *MySQL Workbench* instalado).
 -  Arquivo com os comandos **DDL**: **Criacao_do_banco_dados.sql** para criação do *schema* do banco de dados.
 - Arquivo com os comandos **DML**: **carregamento_dados.sql** para persistência dos dados.
 - Arquivo com os comandos **DQL**: **consultas_analise_dados.sql** para recuperação e análise dos dados persistidos no banco de dados.

:file_folder: **Apresentação**: contém o arquivo **Solução_Modelada_Oficina_Completa.pdf** que descreve todo o racional utilizado para a elaboração desse projeto, desde o levantamento de requisitos, análise das regras de negócio e por fim o modelo EER elaborado.


## As consultas elaboradas no arquivo *consultas_analise_dados.sql* respondem aos seguintes questionamentos:

- Quais são os veículos de cada cliente? 
- Quais são as ordens de serviço dos clientes que iniciam com a letra G?
- Quais são os valores  de peças e serviços das ordens de serviço dos clientes (caso tenham peças ou serviços)?
- Qual a quantidade de ordens liberadas e não liberadas para execução total?
- Quais são os clientes que ainda não liberaram a execução total das ordens de serviço?
-  Quais são as ordens de serviço que possuem mais de 3 itens sem liberação (peças ou serviços) ?



## Software
### MySQL Workbench 8.0 CE

## Autor

Moysés Dutra da Silva
<p>
  <a href="https://www.linkedin.com/in/moyses-dutra/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
  </a> &nbsp; 
  <a href="https://github.com/moysesdutra" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
  </a>
</p>
  

## Licença

[MIT] <https://choosealicense.com/licenses/mit>


### English

# Welcome to the project EER applied to a Car Shop Application!

In this project proposed by DIO, a small context modeling was done on a automotive workshop application.  Some interviews were carried out to identify the customer's needs.  Based on these interviews, an EER model was made.  All activities were done using the MySQL Workbench application  .  All these studies were carried out according to the trail **Construa um Projeto Lógico de Banco de Dados do Zero** from the UNIMED BH 💚 bootcamp with DIO 💪 presented by  **Juliana Mascarenhas**.

# Files and Folders

This study was divided as follows:

:file_folder: **Modelos**:contains the files used in the challenge that consisted of building an EER model for an *automotive workshop*. Here, several entities were considered, worth mentioning the entities Customer, Employee, vehicles, Orders, pars and services as they guided the entire structuring of the model.

-  File created in MySQL Workbench: **OficinaV2.mwb.mwb**
 -  File exported from MySQL Workbench: **OficinaCompleta.png** (if the software *MySQL Workbench* is not available).
 -  File with the **DDL** commands: **Criacao_do_banco_dados.sql** to create the  database schema.
 - File with the  **DML** commands: **carregamento_dados.sql** to populate the database with random data.
 - File with the  **DQL** commands: **consultas_analise_dados.sql** to recover data from database and perform some analysis.


:file_folder: **Apresentação**: contains the file **Solução_Modelada_Oficina_Completa.pdf** thats describe all steps done in this project.

## here are all questions answered by sql queries *consultas_analise_dados.sql* :

- What are customer vehicles??
- What are the customer service orders with a name starting with the letter G?
- How much do parts and services on customer work orders (if they have parts or services) cost?
- How many orders are released or not released?
- Which customers did not complete the order release?
- Which orders have at least 3 items without clearance to do?

## Software

### MySQL Workbench 8.0 CE

## Author

Moysés Dutra da Silva
<p>
  <a href="https://www.linkedin.com/in/moyses-dutra/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
  </a> &nbsp; 
  <a href="https://github.com/moysesdutra" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
  </a>
</p>
  

## License

[MIT] <https://choosealicense.com/licenses/mit>
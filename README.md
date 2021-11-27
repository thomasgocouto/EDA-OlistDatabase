## Desafios Olist Database

Nesses desafios propostos em aula à turma de **Data Science** da [Awari](https://awari.com.br/curso-data-science/), iremos realizar uma breve **EDA** afim de desenvolver habilidade em **SQL** através da resolução de exercícios de diferentes níveis de dificuldade.


## Os Dados
### Olist Database

Os dados utilizados para resolução dos desafios estão dispostos na base de dados da [Olist](https://olist.com/pt-br), a maior loja de departamentos dentro dos marketplaces brasileiros. Sendo uma empresa referência dentro do mercado de **e-commerce**.

### Data Schema

Este banco está estruturado conforme os relacionamentos abaixo. 


![image](https://user-images.githubusercontent.com/56882578/141878593-5bbaac7f-ea77-495c-8bdc-f43b21447809.png)
A database e seu detalhamento podem ser verificados no [Kaggle](https://www.kaggle.com/olistbr/brazilian-ecommerce).


## Ferramenta

A **DBMS** utilizada para construção das queries foi o [Big Query](https://console.cloud.google.com/bigquery).

## Desafios

### Desafio 1 

**Exercício 1:** Selecione os dados da tabela de pagamentos onde só apareçam os tipos de pagamento “VOUCHER” e “BOLETO”. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio1/Exerc%C3%ADcio1.sql)

**Exercício 2:** Retorne os campos da tabela de produtos e calcule o volume de cada produto em um novo campo. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio1/Exerc%C3%ADcio2.sql)

**Exercício 3:** Retorne somente os reviews que não tem comentários.[Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio1/Exerc%C3%ADcio3.sql)

**Exercício 4:** Retorne pedidos que foram feitos somente no ano de 2017. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio1/Exerc%C3%ADcio4.sql)

**Exercício 5:** Encontre os clientes do estado de SP e que não morem na cidade de São Paulo. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio1/Exerc%C3%ADcio5.sql)

### Desafio 2

**Exercício 1:** Retorne a quantidade de itens vendidos em cada categoria por estado em que o cliente se encontra, mostrando somente categorias que tenham vendido uma quantidade de items acima de 1000. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio2/Exerc%C3%ADcio1.sql)

**Exercício 2:** Mostre os 5 clientes (customer_id) que gastaram mais dinheiro em compras, qual foi o valor total de todas as compras deles, quantidade de compras, e valor médio gasto por compras. Ordene os mesmos por ordem decrescente pela média do valor de compra. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio2/Exerc%C3%ADcio2.sql)

**Exercício 3:** Mostre o valor vendido total de cada vendedor (seller_id) em cada uma das categorias de produtos, somente retornando os vendedores que nesse somatório e agrupamento venderam mais de $1000. Desejamos ver a categoria do produto e os vendedores. Para cada uma dessas categorias, mostre seus valores de venda de forma decrescente. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio2/Exerc%C3%ADcio3.sql)

### Desafio 3

**Exercício 1:** Crie uma tabela analítica de todos os itens que foram vendidos, mostrando somente pedidos interestaduais. Queremos saber quantos dias os fornecedores demoram para postar o produto, se o produto chegou ou não no prazo. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio3/Exerc%C3%ADcio1.sql)

**Exercício 2:** Retorne todos os pagamentos do cliente, com suas datas de aprovação, valor da compra e o valor total que o cliente já gastou em todas as suas compras, mostrando somente os clientes onde o valor da compra é diferente do valor total já gasto. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio3/Exerc%C3%ADcio2.sql)

**Exercício 3:** Retorne as categorias válidas, suas somas totais dos valores de vendas, um ranqueamento de maior valor para menor valor junto com o somatório acumulado dos valores pela mesma regra do ranqueamento. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio3/Exerc%C3%ADcio3.sql)

### Desafio 4

**Exercício 1:** Crie uma view (SELLER_STATS) para mostrar por fornecedor, a quantidade de itens enviados, o tempo médio de postagem após a aprovação da compra, a quantidade total de pedidos de cada Fornecedor, note que trabalharemos na mesma query com 2 granularidades diferentes. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio4/Exerc%C3%ADcio1.sql)

**Exercício 2:** Queremos dar um cupom de 10% do valor da última compra do cliente. Porém os clientes elegíveis a este cupom devem ter feito uma compra anterior a última (a partir da data de aprovação do pedido) que tenha sido maior ou igual o valor da última compra. Crie uma querie que retorne os valores dos cupons para cada um dos clientes elegíveis. [Query](https://github.com/thomasgocouto/EDA-OlistDatabase/blob/main/Desafio4/Exerc%C3%ADcio2.sql)

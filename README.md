# Desafio 01 - CRUD - Refeições diárias

**RocketSeat - Ignite/Elixir**

## 💻 Sobre o desafio

Nesse desafio, você deverá criar uma aplicação para monitoramento de consumo de alimentos durante o dia.

O schema de uma refeição deverá possuir os seguintes campos:

```elixir
# Meal
{
	id: id,
	descricao: descricao,
	data: data,
	calorias: calorias
}
```

**Obs:** O Id deve ser gerado automaticamente, pode ser um inteiro ou um UUID, mas não pode se repetir.

- Para criar um campo com uma data no Ecto, em seu schema, você deverá utilizar o tipo `:datetime`;
- O campo `descricao` irá possuir informações sobre o que foi consumido no momento (tipo de dado: string);
- O campo `data` deverá armazenar a data e hora em que o alimento foi consumido;
- O campo `calorias` irá possuir informações sobre a quantidade de calorias do alimento consumido;
- Os dados deverão ser salvos em uma tabela chamada `meals`.

A aplicação deverá possuir rotas para satisfazer os requisitos de um CRUD normal:

1. Deve ser possível cadastrar uma refeição feita, retornando um status `201` e a informação criada;
2. Deve ser possível atualizar uma refeição já cadastrada, retornando um status `200` e a refeição atualizada;
3. Deve ser possível exibir uma refeição existente, retornando um status `200` e a refeição buscada;
4. Deve ser possível excluir uma refeição cadastrada, retornando um status `200` ou `204`.

# Desafio 02 - Testando a aplicação
## 💻 Sobre o desafio

Nesse desafio, você deverá criar testes para a aplicação que foi desenvolvida ao longo desse módulo. 
Caso você já tenha desenvolvido os testes como forma de complementar a aplicação, basta submeter o link do mesmo repositório para esse desafio.

É importante que os testes tenham uma cobertura de 100%

# Executando no Rest Client

![MYFOODDIARY](https://user-images.githubusercontent.com/57791712/113526228-9e157380-958f-11eb-91c1-f88db6c2bb45.gif)



#language: pt

Funcionalidade: Pesquisa de funcionario
    Para averiguar informações
    O usuario do sistema
    Deseja poder consultar informações dos funcionarios
    e Adicionar ou Alterar os dados

    @PUT
    Cenario: Buscar informações de funcionario
        Dado que o usuario altere informações de funcionario
        Quando realizar o PUT
        Então O status code deve retornar sucesso para alterações alteradas
#language: pt

Funcionalidade: Pesquisa de funcionario
    Para averiguar informações
    O usuario do sistema
    Deseja poder consultar informações dos funcionarios
    e Adicionar ou Alterar os dados

    @DELETE
    Cenario: Buscar informações de funcionario
        Dado que o usuario delete informações de funcionario
        Quando realizar o DELETE
        Então O status code deve retornar sucesso para delete
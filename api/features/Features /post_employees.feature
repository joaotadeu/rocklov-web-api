#language: pt

Funcionalidade: Pesquisa de funcionario
    Para averiguar informações
    O usuario do sistema
    Deseja poder consultar informações dos funcionarios
    e Adicionar ou Alterar os dados

    @POST
    Cenario: Buscar informações de funcionario
        Dado que o usuario cadastre novas informações de funcionario
        Quando realizar o POST
        Então O status code deve retornar sucesso
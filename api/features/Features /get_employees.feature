#language: pt

Funcionalidade: Pesquisa de funcionario
    Para averiguar informações
    O usuario do sistema
    Deseja poder consultar informações dos funcionarios

    @GET
    Cenario: Buscar informações de funcionario
        Dado que o usuario consulte informações de funcionario
        Quando realizar o GET
        Então O status code deve retornar 200
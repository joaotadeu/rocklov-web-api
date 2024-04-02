#language: pt

Funcionalidade: Acessando pagina WEB e posicionando item no carrinho
    Acessando site amazon que vende produtos diversos
    Posicionando item no carrinho
    validando que o item foi adicionado com sucesso
    
@acessando_amazon
Cenario: Acessando pagina web e posicionando item no carrinho e efetuando validação
Dado que abro o navegador e acesso pagina da amazon
Quando posiciono um item no carrinho "codigo limpo"
Então valido que o item foi posicionado com sucesso e foi apresentado mensagem "Adicionado ao carrinho"
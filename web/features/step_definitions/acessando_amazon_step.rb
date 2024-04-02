Dado("que abro o navegador e acesso pagina da amazon") do
  @NavegandoAmazon.AcessarPaginaWeb
  expect(page).to have_current_path('https://www.amazon.com.br', url: true)
end

Quando ("posiciono um item no carrinho {string}") do |item|
  @NavegandoAmazon.PosicionandoItemCarrinho(item)
end

Então("valido que o item foi posicionado com sucesso e foi apresentado mensagem {string}") do |mensagem_esperada|
  @NavegandoAmazon.ItemPosicionadoCarrinho
  if @NavegandoAmazon.ItemPosicionadoCarrinho.text.include?(mensagem_esperada)
    puts "Mensagem esperada encontrada: #{mensagem_esperada}"
  else
    raise "Erro: Mensagem esperada não encontrada. Esperada: #{mensagem_esperada}. Obtida: #{@NavegandoAmazon.ItemPosicionadoCarrinho.text}"
  end
end
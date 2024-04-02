Dado('que estou na página principal da Starbugs') do
    @PageStarbugs.AbrePaginaStarbugs
    expect(page).to have_current_path('https://starbugs.vercel.app', url: true)
end

Então('eu devo visualizar uma lista de cafés disponíveis') do
    expect(@PageStarbugs.ListaCafe.size).to be <= 8
end

E('que desejo comprar o seguinte produto:') do |table|
    @produto = table.hashes.first
end
  
Quando('inicio a compra desse item') do
   @PageStarbugs.CompraCafe(@produto[:Nome].to_s) #<< Aqui foi esperado um argumento tipo string
end
  
Então('devo ver a página de Checkout com os detalhes do produto') do
    @PageStarbugs.DetalhesProduto(@produto)
end
  
Então('o valor total da compra deve ser de {string}') do |valor_total|
   @PageStarbugs.DetalhesProdutoTotal(valor_total)
end
  
Dado('que iniciei a compra do item {string}') do |produto|
   @PageStarbugs.CompraCafe(produto)
end
  
Quando('faço a busca do seguinte CEP: {string}') do |cep|
    @PageStarbugs.CodigoEnderecoPostal(cep)
end
  
Quando('informo os demais dados do endereço:') do |table|
    endereço = table.hashes.first
    @PageStarbugs.Endereço(endereço)
end
  
Quando('escolho a forma de pagamento: {string}') do |metodo_pagamento|
   @PageStarbugs.MetodoPagamento(metodo_pagamento)
end
  
Quando('por fim finalizo a compra') do
   @PageStarbugs.ConfirmarPedido
end
  
Então('sou redirecionado para a página de confirmação de Pedidos e visualizo a mensagem {string}') do |mensagem_esperada|
    @PageStarbugs.DetalhesPedido(mensagem_esperada)
end
  
Então('deve ser informado o seguinte prazo de entrega: {string}') do |mensagem_esperada|
    @PageStarbugs.DetalhesEntrega(mensagem_esperada)
end
  
Então('devo ver um popup informando que o produto está indisponível com a mensagem {string}') do |mensagem_esperada|
    @PageStarbugs.CompraIndisponivel(mensagem_esperada)
end
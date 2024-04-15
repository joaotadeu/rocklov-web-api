require 'rspec'

class PageStarbugs
    include Capybara::DSL
    include RSpec::Matchers 
  
    def AbrePaginaStarbugs
      visit 'https://starbugs.vercel.app/'
    end
  
    def ListaCafe
      return all('.coffee-item')
    end
  
    def CompraCafe(nome_cafe)
      produto = find('.coffee-item', text: nome_cafe) 
      produto.find('.buy-coffee').click
    end

    def DetalhesProduto(produto)
      titulo_do_produto = find('.item-details')
      expect(titulo_do_produto.text).to eql produto[:Nome]

      preco_do_produto = find('.sub-price')
      expect(preco_do_produto.text).to eql produto[:Preço]

      delivery = find('.delivery-price')
      expect(delivery.text).to eql produto[:Entrega]
    end

    def DetalhesProdutoTotal(valor_total)
      preco = find('.total-price')
      expect(preco.text).to eql valor_total
    end

    def CodigoEnderecoPostal(cep)
      find('input[name=cep]').set(cep)
      click_on 'Buscar CEP'
    end

    def Endereço(endereco)
      find('input[name=number]').set(endereco[:Numero])
     find('input[name=complement]').set(endereco[:Detalhes])
    end

    def MetodoPagamento(metodo_pagamento)
      find('label div', text: metodo_pagamento.upcase).click
    end

    def ConfirmarPedido
      click_on 'Confirmar pedido'
    end

    def DetalhesPedido(mensagem_esperada)
      expect(find('h1').text).to eql mensagem_esperada
      expect(find('p[color=subtitle]').text).to eql 'Agora é só aguardar que logo o café chegará até você'
    end
    
    def DetalhesEntrega(mensagem_entrega)
      tempo_entrega = find('p', text: "Previsão de entrega")
      expect(tempo_entrega.find('strong').text).to eql '20 min - 30 min'
    end

    def CompraIndisponivel(mensagem_esperada)
      popup = find('.swal2-html-container')
      expect(popup.text).to eql mensagem_esperada 
    end
end
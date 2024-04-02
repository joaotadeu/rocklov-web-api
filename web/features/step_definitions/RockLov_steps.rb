Dado('que estou na página de login do RockLov') do
    @NavegarRockLov.AcessarPaginaRockLovLogin
end

Dado('que estou na página de cadastro do RockLov') do
    @NavegarRockLov.AcessarPaginaRockLovCadastro
end
  
Dado('devo visualizar todos com componentes disponiveis na tela de cadastro') do
   expect(@NavegarRockLov.ListaElementosRockLovCadastro).to be_visible
end

Quando('preencho minhas credenciais {string} e {string}') do |email, senha|
  @NavegarRockLov.LoginComSucesso(email,senha)
end

Quando('preencho minhas credenciais de cadastro') do |table|
    table.hashes.each do |dados_usuario|
      @NavegarRockLov.CadastroRockLov(dados_usuario['nome'], dados_usuario['email'], dados_usuario['senha'])
    end
end

Então('efetuo a operação deletar anuncio') do
  @NavegarRockLov.DeletarAnuncio
end

Então('devo ver a seguinte mensagem {string}') do |mensagem_esperada|
    expect(@NavegarRockLov.MensagemEsperadaTentativaCadastro(mensagem_esperada)).to be true
end
  
E('sou direcionado para o dashboard e visualizo a seguinte mensagem {string}') do |mensagem_esperada|
    expect(@NavegarRockLov.MensagemEsperadaDashboard(mensagem_esperada)).to be true
end

Então('devo visualizar todos com componentes disponiveis na tela de login') do
  expect(@NavegarRockLov.ListaElementosRockLovLogin).to be_visible
  #expect(page).to have_selector('p#meu-elemento', text: 'Seu texto específico aqui') << Texto Especifico presente em um elemento específico
  #expect(page).to have_content('Seu texto específico aqui') << verifica se a página atual contém o texto especificado
end

Então('valido que fui logado com sucesso') do
  expect(@NavegarRockLov.MensagemEsperadaDashboard(mensagem_esperada)).to be true
end

Então('efetuo tentativa de cadastro do anuncio') do |table|
    table.hashes.each do |dados_usuario|
      @NavegarRockLov.CriarAnuncio(dados_usuario['Equipamento'], dados_usuario['Categoria'], dados_usuario['Valor_Diaria'], dados_usuario['Caminho_Arquivo'])
    end
end

E('valido que apos quatro anuncios é visto a mensagem {string}') do |msg_falha_campo|
  mensagem_esperada = @NavegarRockLov.MensagemEsperadaCadastroSemSucesso
  expect(mensagem_esperada).to eql(msg_falha_campo)
end
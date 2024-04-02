Dado("que abro o navegador e acesso a pagina") do
  @Navegador.AbrirPagina
  expect(page).to have_current_path("https://buger-eats.vercel.app/", url: true)
  @Navegador.CadastroParceiro
end
  
Quando("preencho os dados do parceiro") do |table|
  DadosDoParceiro = table.hashes
  DadosDoParceiro.each do |dados_parceiro|
  @Navegador.PreencherDadosParceiro(DadosDoParceiro)
  end
end
  
E("escolho o metodo de entrega") do |table|
  tipos_entrega = table.hashes
  @Navegador.MetodoEntrega(tipos_entrega)
end

E("efetuo o upload da CNH") do |table|
  caminhos_arquivos_cnh = table.hashes
  caminhos_arquivos_cnh.each do |caminho_arquivo_cnh|
    @Navegador.UploadCnh(caminho_arquivo_cnh['CNH'])
  end
end

Então('devo ver a mensagem {string}') do |mensagem_esperada|
  @Navegador.DadosRecebidosSucesso
  if @Navegador.DadosRecebidosSucesso.text.include?(mensagem_esperada)
    puts "Mensagem esperada encontrada: #{mensagem_esperada}"
  else
    raise "Erro: Mensagem esperada não encontrada. Esperada: #{mensagem_esperada}. Obtida: #{@Navegador.DadosRecebidosSucesso.text}"
  end
end
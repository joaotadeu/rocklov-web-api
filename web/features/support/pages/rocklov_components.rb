class NavegarRockLov < SitePrism::Page

    def initialize
        @FunçõesGenericas = GenericFunctions.new
    end

    def AcessarPaginaRockLovLogin
        visit 'http://rocklov-web:3000/'
    end

    def AcessarPaginaRockLovCadastro
        visit 'http://rocklov-web:3000/signup'
    end

    def ListaElementosRockLovLogin
        find('#email')
        find('#password')
        find('.btn-primary')
        find('.link')
    end

    def ListaElementosRockLovCadastro
        find('#fullName')
        find('#email')
        find('#password')
        find('.btn-primary')
        find('.link')
    end

    def CadastroRockLov(nome, email, senha)
        find('#fullName').set(nome)
        find('#email').set(email)
        find('#password').set(senha)
        click_on "Cadastrar" 
    end
    
    def MensagemEsperadaTentativaCadastro(mensagem_esperada)
        mensagem_recebida = find('.alert-dark').text
        mensagem_recebida.eql?(mensagem_esperada)
    end

    def MensagemEsperadaDashboard(mensagem_esperada)
        mensagem_recebida = find('.nav').text
        mensagem_recebida.eql?(mensagem_esperada)
    end

    def LoginComSucesso(email, senha)
        find('#email').set(email)
        find('#password').set(senha)
        click_on "Entrar"
    end

    def CriarAnuncio(equipamento, categoria, valor_diaria, caminho_arquivo)
        find('.btn').click
        find('input[placeholder$=equipamento]').set(equipamento)
        find('#category').find('option', text: (categoria)).select_option
        find('input[placeholder*=Valor]').set(valor_diaria)
        file_input = Dir.pwd + '/features/support/images/' + caminho_arquivo
        find('#thumbnail input[type=file]', visible: false).set file_input        
        click_on "Cadastrar"
    end 

    def MensagemEsperadaCadastroSemSucesso
        find('.alert').text
    end

    def DeletarAnuncio
    find('.equipo-list > li:nth-child(1) > i:nth-child(4)').click
    click_on 'Sim'
    end

    def ConfirmoExclusao
        click_on "Sim"
    end

    def SolicitoExclusao(name)
        equipo = find(".equipo-list li", text: name)
        equipo.find(".delete-icon").click
    end

    def ValidacaoEquipo?(name)
        return result = page.has_no_css?(".equipo-list li", text: name)
    end
end
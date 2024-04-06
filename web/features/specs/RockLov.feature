#language: pt

@RockLov
Funcionalidade: Acessando pagina Web RockLov
    Acessando site RockLov
    Acessar com credenciais
    Validar que o acesso foi feito com sucesso
    Efetuar cadastro de anuncio

    @validação_campos_login
    Cenario: Acessar site rocklov e validar os componentes em tela
    Dado que estou na página de login do RockLov
    Então devo visualizar todos com componentes disponiveis na tela de login

    @validação_campos_cadastro
    Cenario: Acessar site rocklov e validar os componentes em tela
    Dado que estou na página de cadastro do RockLov
    Então devo visualizar todos com componentes disponiveis na tela de cadastro

    @tentativa_cadastro_rocklov
    Esquema do Cenario: Acessando e efetuando tentativa de cadastro web rocklov
    Dado que estou na página de cadastro do RockLov
    Quando preencho minhas credenciais de cadastro
        | nome   | email   | senha   |
        | <nome> | <email> | <senha> |
    Então devo ver a seguinte mensagem "<mensagem_esperada>"

    Exemplos:
        | nome            | email                   | senha | mensagem_esperada                |
        |                 | dianinha2@gmail.com     | 123   | Oops. Informe seu nome completo! |
        | João Tadeu      |                         | 321   | Oops. Informe um email válido!   |
        | Manu dos anjos  | manuzinha2@outlook.com  |       | Oops. Informe sua senha secreta! |

    @cadastro_com_sucesso
    Esquema do Cenario: Acessando e efetuando de cadastro web rocklov
    Dado que estou na página de cadastro do RockLov
    Quando preencho minhas credenciais de cadastro
        | nome   | email   | senha   |
        | <nome> | <email> | <senha> |
    Então sou direcionado para o dashboard e visualizo a seguinte mensagem "<mensagem_esperada>"

    Exemplos:
        | nome            | email                   | senha | mensagem_esperada |
        | João Tadeu      | joaoTadeu4@gmail.com    | 321   | Let`s Rock Baby   |
        | Manu dos anjos  | manuzinha4@outlook.com  | 123   | Let`s Rock Baby   |

    @login_rocklov
    Cenario: Acessar pagina rocklov web e efetuar o login
    Dado que estou na página de login do RockLov
    Quando preencho minhas credenciais "teste@gmail.com" e "123"
    E sou direcionado para o dashboard e visualizo a seguinte mensagem "Let`s Rock Baby"

    @cadastro_de_anuncio
    Esquema do Cenario: Acessar pagina de cadastro de anuncio e efetuar o cadastro do mesmo
    Dado que estou na página de login do RockLov
    Quando preencho minhas credenciais "teste@gmail.com" e "123"
    E sou direcionado para o dashboard e visualizo a seguinte mensagem "Let`s Rock Baby"
    Então efetuo tentativa de cadastro do anuncio
        | Equipamento   | Categoria   | Valor_Diaria    | Caminho_Arquivo   |
        | <Equipamento> | <Categoria> | <Valor_Diaria>  | <Caminho_Arquivo> |
    
    Exemplos:
        | Equipamento   | Categoria          | Valor_Diaria  | Caminho_Arquivo |
        | Violão        | Cordas             | 100           | Violão.png      |  
        | Subwoofer     | Áudio e Tecnologia | 250           | Subwoofer.png   |
        | Bateria       | Baterias           | 350           | Bateria.png     |
        | Teclado       | Teclas             | 400           | Teclado.png     |

    @cadastro_de_anuncio_sem_sucesso
    Esquema do Cenario: Acessar pagina de cadastro de anuncio e efetuar o cadastro do mesmo
    Dado que estou na página de login do RockLov
    Quando preencho minhas credenciais "teste@gmail.com" e "123"
    E sou direcionado para o dashboard e visualizo a seguinte mensagem "Let`s Rock Baby"
    Então efetuo tentativa de cadastro do anuncio
        | Equipamento   | Categoria   | Valor_Diaria    | Caminho_Arquivo   |
        | <Equipamento> | <Categoria> | <Valor_Diaria>  | <Caminho_Arquivo> |
    E valido que apos quatro anuncios é visto a mensagem "<Mensagem_esperada>"
    
    Exemplos:
        | Equipamento  | Categoria          | Valor_Diaria  | Caminho_Arquivo | Mensagem_esperada                   |
        | Guitarra     | Cordas             |               | Guitarra.png    | 💰 Informe o valor da diária         |
        |              | Baterias           | 350           | Bateria.png     | 🎸 Informe a descrição do anúncio!   |
    
    @deletar_anuncio_web
    Esquema do Cenario: Acessar pagina rocklov web e efetuar o login e deletar um anuncio
    Dado que estou na página de login do RockLov
    Quando preencho minhas credenciais "teste@gmail.com" e "123"
    E sou direcionado para o dashboard e visualizo a seguinte mensagem "Let`s Rock Baby"
    Então efetuo tentativa de cadastro do anuncio
        | Equipamento   | Categoria   | Valor_Diaria    | Caminho_Arquivo   |
        | <Equipamento> | <Categoria> | <Valor_Diaria>  | <Caminho_Arquivo> | 
    Então efetuo a operação deletar anuncio
    
    Exemplos:
        | Equipamento   | Categoria          | Valor_Diaria  | Caminho_Arquivo |
        | Violão        | Cordas             | 100           | Violão.png      | 


    @Remover_anuncio_web_api
    Cenario: Acessar pagina rocklov na plataforma web efetuar o login e remover um anuncio
    Dado que estou na página de login do RockLov
    Quando preencho minhas credenciais "teste@gmail.com" e "123"
        E farei o cadastro de um anuncio aleatorio
            | thumb      | Bateria.png    |
            | nome       | Bateria        |
            | categoria  | Baterias       |
            | valor      | 50             |
    Então solicito a exclusão do item
        E confirmo a exclusão
        E não devo ver o anuncio no meu dashboard
***Settings***
Resource    ../resources/Resources.robot
Test Setup    Abre o navegador
Suite Setup   Conectar API


#Test TearDown   Fechar o navegador

***Test Case***

Cenário 01: Acessar Página Clash Royale API

   Dado que estou na página do site
   Quando clico em Login
   E informo "Email" e "Senha"
   E clico em "Log In"
   #Então é carregada a tela Clash Royale API

#Cenário 02: Criar nova Chave

    Quando que clico no Submenu com o nome de usuário
    Dado que estou na página My Account
    #E clico em "My Account"
    E clico em "Create New key"
    Então é carregada a tela new key
    Quando Preencho os campos "KEY NAME","DESCIPTION" e "ALLOWED IP ADDRESSES"
    Então uma nova key é criada com sucesso
    Quando faço a requisição das informações do Clan




#
*** Keywords ***

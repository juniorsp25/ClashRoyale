*** Settings ***
Documentation   Documentação API  https://developer.clashroyale.com/#/documentation
Library  RequestsLibrary
Library  Collections
Library  SeleniumLibrary
Library  OperatingSystem



*** Variables ***
# Varíaveis Globais

${EMAIL}   seuusario@usuario
${SENHA}   ******
${BROWSER}  chrome
${URL}   https://developer.clashroyale.com/
${K_NAME}  Juniorsp30
${DESCRIPTION_K}   AutomationThursday
${IP_ADSRESS}   201.182.165.134
${URL_API}    https://api.clashroyale.com/v1/clans/%20%239V2Y%20/


*** Keywords ***
### Setup e TearDown
Abre o navegador
   Open Browser    about:blank   ${BROWSER}
   Maximize Browser Window

Fechar o navegador
   Close Browser

# Step and Actions

Dado que estou na página do site
  Go To             ${URL}
  Title Should be   Clash Royale API


### acessando a página de Login
Quando clico em Login
  Wait Until Element is Visible   xpath=//div[@class="login-menu"]/a[contains(text(),"Log In")]
  Click Element     xpath=//div[@class="login-menu"]/a[contains(text(),"Log In")]


#Dados informados pelo usuário
E informo "Email" e "Senha"
  Input Text        xpath=//*[@id="email"]   ${EMAIL}
  Input Text        xpath=//*[@id="password"]   ${SENHA}


# Ação botão login para acessar a página
E clico em "Log In"
  Click Element   xpath=//button[@type="submit"]


#acessando my account
Quando que clico no Submenu com o nome de usuário
  Wait Until Element is Visible   css=#content > div > div.drawer-main-container > div > header > div > div > div:nth-child(3) > div > div > button > span.dropdown-toggle__text
  Click Element   xpath=//button[@type="button"]
  Click Element  css=#content > div > div.drawer-main-container > div > header > div > div > div:nth-child(3) > div > div > ul > li:nth-child(1) > a


#Validar se a página da API foi carregada
Dado que estou na página My Account
  Wait Until Element is Visible    xpath=//*[@id="content"]//following::section[@class="account__keys"]
  Title Should be   Clash Royale API

E clico em "Create New key"
  Click Element   xpath=//*[@class="create-key-btn btn btn-icon btn-primary btn-lg"]


#Validar se estou na tela New KEY
Então é carregada a tela new key
   Wait Until Element is Visible  xpath=//*[@id="content"]//form/div[1]/label[contains(text(),"Key Name")]


Quando Preencho os campos "KEY NAME","DESCIPTION" e "ALLOWED IP ADDRESSES"
   Input Text   xpath=//input[@id="name"]   ${K_NAME}
   Input Text   xpath=//textarea[@id="description"]    ${DESCRIPTION_K}
   Input Text   //*[contains(text(), "Allowed IP Addresses")]/following::input   ${IP_ADSRESS}


Então uma nova key é criada com sucesso
  Click Element  xpath=//button[@type="submit"]
# Validar se foi criada com sucesso
  Wait Until Element is Visible   xpath=//span[contains(text(),"Key created successfully.")]

# Evidencia último passo realizado com sucesso
  Capture Page Screenshot  testeExecutadoComSucesso.png

### API
Conectar API
  Create Session   clashAPI   ${URL_API}

  #Step Action
Quando faço a requisição das informações do Clan
  ${RESPOSTA}   Get Request   clashAPI
  Log           ${RESPOSTA.text}

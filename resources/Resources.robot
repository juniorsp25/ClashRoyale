*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# Varíaveis Globais

${EMAIL}   luizjunior.tec@gmail.com
${SENHA}   cap1993@
${BROWSER}  chrome
${URL}   https://developer.clashroyale.com/
${K_NAME}  Juniorsp30
${DESCRIPTION_K}   AutomationThursday
${IP_ADSRESS}   192.168.56.1



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
  Capture Page Screenshot

### acessando a página de Login
Quando clico em Login
  Wait Until Element is Visible   xpath=//div[@class="login-menu"]/a[contains(text(),"Log In")]
  Click Element     xpath=//div[@class="login-menu"]/a[contains(text(),"Log In")]
  Capture Page Screenshot

#Dados informados pelo usuário
E informo "Email" e "Senha"
  Input Text        xpath=//*[@id="email"]   ${EMAIL}
  Input Text        xpath=//*[@id="password"]   ${SENHA}
  Capture Page Screenshot

# Ação botão login para acessar a página
E clico em "Log In"
  Click Element   xpath=//button[@type="submit"]
  Capture Page Screenshot

#acessando my account
Quando que clico no Submenu com o nome de usuário
  Wait Until Element is Visible   css=#content > div > div.drawer-main-container > div > header > div > div > div:nth-child(3) > div > div > button > span.dropdown-toggle__text
  Click Element   xpath=//button[@type="button"]
  Click Element  css=#content > div > div.drawer-main-container > div > header > div > div > div:nth-child(3) > div > div > ul > li:nth-child(1) > a
  Capture Page Screenshot

#Validar se a página da API foi carregada
Dado que estou na página My Account
  Wait Until Element is Visible    xpath=//*[@id="content"]//following::section[@class="account__keys"]
  Capture Page Screenshot
  Title Should be   Clash Royale API

E clico em "Create New key"
  Click Element   xpath=//*[@class="create-key-btn btn btn-icon btn-primary btn-lg"]
  Capture Page Screenshot

#Validar se estou na tela New KEY
Então é carregada a tela new key
   Wait Until Element is Visible  xpath=//*[@id="content"]//form/div[1]/label[contains(text(),"Key Name")]
   Capture Page Screenshot

Quando Preencho os campos "KEY NAME","DESCIPTION" e "ALLOWED IP ADDRESSES"
   Input Text   xpath=//input[@id="name"]   ${K_NAME}
   Input Text   xpath=//textarea[@id="description"]    ${DESCRIPTION_K}
   Input Text   //*[contains(text(), "Allowed IP Addresses")]/following::input   ${IP_ADSRESS}
   Capture Page Screenshot

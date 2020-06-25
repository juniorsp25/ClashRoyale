*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# Varíaveis Globais

${EMAIL}   luizjunior.tec@gmail.com
${SENHA}   cap1993@
${BROWSER}  chrome
${URL}   https://developer.clashroyale.com/


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

  Click Element  xpath=//button[@type="button"]
  Wait Until Element is Visible   css=#content > div > div.drawer-main-container > div > div
  Wait Until Element is Visible  css=#content > div > div.drawer-main-container > div > header > div > div > div:nth-child(3) > div > div > ul
  Click Element  css=#content > div > div.drawer-main-container > div > header > div > div > div:nth-child(3) > div > div > ul > li:nth-child(1) > a

#Validar se a página da API foi carregada
#Dado que estou na página My Account
  #####################

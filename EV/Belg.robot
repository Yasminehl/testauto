*** Settings ***
Library    SeleniumLibrary
Library    pyperclip

*** Variables ***
${urlEmail}   https://yopmail.com/fr/
${browser}    edge
#${element_locator}    //input[@data-input='contactEmail']
#${ctrl_v}    \\u0076\\u0066
${company_name_locator}    xpath=//label[text()='Raison sociale']/parent::div//input
${siret_number_locator}    xpath=//label[text()="N° d'entreprise"]/parent::div//input
${street_address_locator}    xpath=//label[text()='Rue']/following::input[@data-id='addressStreet']
${street_number_locator}    xpath=//label[text()='Numéro']/following::input[@data-id='addressNumber']
${box_number_locator}    xpath=//label[text()='Boite']/following::input[@data-id='addressBox']

*** Test Cases ***
Parcours
    Open Browser   https://diac--uatrun.sandbox.my.site.com/B2BEV/s/?  ${browser}

    sleep  5
    Wait Until Page Contains Element    //label[@for='BE-8']
    Click Element    //label[@for='BE-8']

    sleep  5
    # Wait for the element with label 'fr_be-11' to appear
    Wait Until Page Contains Element    //label[@for='fr_be-8']
    Click Element    //label[@for='fr_be-8']

    sleep  5
    # Wait for the button "Je commande mes cartes" to appear and click it
    Wait Until Page Contains Element   //button[contains(text(),'Je commande mes cartes')]
    Click Element      //button[contains(text(),'Je commande mes cartes')]

Cordonnee
    sleep  5
    Wait Until Page Contains Element    ${company_name_locator}
    Input Text    ${company_name_locator}    CGI

    Wait Until Page Contains Element   ${siret_number_locator}
    Input Text    ${siret_number_locator}    0123456789

    sleep   5

   #  Wait Until Page Contains Element    //div[@data-id='addressStreet']//input[@type='text']   timeout=20s
    #Input Text    //div[@data-id='addressStreet']//input[@type='text']   adresse

    Wait Until Page Contains Element    xpath=//label[text()='Rue']/following::input[@type='text']    timeout=20s
    Input Text    xpath=//label[text()='Rue']/following::input[@type='text']    adress adress

    Wait Until Page Contains Element    xpath=//label[text()='Numéro']/following::input[@type='text']    timeout=20s
    Input Text    xpath=//label[text()='Numéro']/following::input[@type='text']    11
    #Wait Until Page Contains Element    xpath=//label[text()='Boite']/following::input[@type='text']    timeout=20s
    #Input Text    xpath=//label[text()='Boite']/following::input[@type='text']   244

    Wait Until Page Contains Element    //input[@data-input="postCode"]
    Input Text      //input[@data-input="postCode"]    75019

    sleep  5
    Wait Until Page Contains Element    //input[@data-inputval='city']
    Input Text     //input[@data-inputval='city']    Paris


   # Wait Until Page Contains Element    ${street_number_locator}
    #Input Text    ${street_number_locator}    21

    #Wait Until Page Contains Element    ${box_number_locator}
    #Input Text    ${box_number_locator}    5



     sleep  20

*** Keywords ***

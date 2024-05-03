*** Settings ***
Library    SeleniumLibrary
Library    pyperclip
Library    OperatingSystem

*** Variables ***
${urlEmail}   https://yopmail.com/fr/
${browser}   edge
${element_locator}    //input[@data-input='contactEmail']
${ctrl_v}    \\u0076\\u0066

*** Test Cases ***

Accueil
   Open Browser   https://diac--preprod.sandbox.my.site.com/lub2b/s/?language=fr_LU    ${browser}

   wait_until_page_contains_element   //button[@id='teal-consent-prompt-submit']  timeout=20
   click element   //button[@id='teal-consent-prompt-submit']

   wait_until_page_contains_element  xpath=//button[contains(text(), "OK, allons-y")]   timeout=20
   Click Element    xpath=//button[contains(text(), "OK, allons-y")]



Vehicule

    sleep  5
    wait_until_page_contains_element  //button[@class='m-vehicle__btn m-vehicle__btn--plus']
   click element  //button[@class='m-vehicle__btn m-vehicle__btn--plus']
   sleep  5
   Wait Until Page Contains Element    //input[@data-input='contactEmail']
    # Input text into the input field
    Input Text    //input[@data-input='contactEmail']    example@example.com


   sleep  5
    wait_until_page_contains_element  //input[@data-id='optIn2']
    click element  //input[@data-id='optIn2']
    wait_until_page_contains_element  //button[@data-id='goToNextStep']
    click element    //button[@data-id='goToNextStep']
Carte


    wait_until_page_contains_element    //b[@class='bold_discount']   timeout=20
    Click Element    //b[@class='bold_discount']

    Wait Until Page Contains Element    //label[@for="all-147"]
    Click Element    //label[@for="all-147"]
    sleep   5

    wait_until_page_contains_element  //button[@class='btn btn-primary']
     click element    //button[@class='btn btn-primary']
     sleep   5

    Wait Until Page Contains Element    //label[@for="Luxembourg-66"]
    Click Element    //label[@for="Luxembourg-66"]
    sleep   5

    Wait Until Page Contains Element    //label[@for="02-67"]
    Click Element    //label[@for="02-67"]
    sleep   5

    Wait Until Page Contains Element    //label[@for="04-69"]
    Click Element    //label[@for="04-69"]
    sleep   5

    Click Button    //button[@name="gotoNextStep" and @data-id="gotoNextStep"]

    sleep  20
*** Keywords ***
Get Clipboard Content
    [Documentation]    Get the content of the clipboard
    ${content}=    Run Keyword And Return     Evaluate    pyperclip.paste()    # Utilise pyperclip pour obtenir le contenu du presse-papiers
    RETURN    ${content}
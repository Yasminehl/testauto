*** Settings ***
Library    SeleniumLibrary
Library    pyperclip
Library    String

*** Variables ***
${urlEmail}   https://yopmail.com/fr/
${browser}   edge
${element_locator}    //input[@data-input='contactEmail']
${ctrl_v}    \\u0076\\u0066
${company_number}    ${random_string}[0-9]{10}
${vat_number}       ${random_string}[0-9]{10}

*** Test Cases ***

Vehicules
    Open Browser    ${urlEmail}   ${browser}
    Maximize Browser Window
    ${random_letters}=    Generate Random String    8    [LETTERS]
    wait_until_page_contains_element  //input[@id='login']
    Input Text     //input[@id='login']    ${random_letters}
    sleep     5
    wait_until_page_contains_element  //button[@class='md']
    Click Element    //button[@class='md']
    sleep     5
    wait_until_page_contains_element  //button[@id='cpalias']
    Click Element    //button[@id='cpalias']
    Close Browser

    Open Browser   https://diac--preprod.sandbox.my.site.com/beb2b/s/?language=fr_BE    ${browser}
    Maximize Browser Window
    wait_until_page_contains_element   //button[@id='teal-consent-prompt-submit']
    click element   //button[@id='teal-consent-prompt-submit']
    sleep     5
    wait_until_page_contains_element  //input[@data-input='contactEmail']
    ${clipboard_content}=    Get Clipboard Content
    Input Text    ${element_locator}    ${clipboard_content}
    sleep     5
    wait_until_page_contains_element  //button[@class='btn btn-primary']
    click element  //button[@class='btn btn-primary']
    sleep     5

    wait_until_page_contains_element  //button[@class='m-vehicle__btn m-vehicle__btn--plus']
    click element  //button[@class='m-vehicle__btn m-vehicle__btn--plus']
    sleep     5
    wait_until_page_contains_element  //input[@data-id='optIn3']
    click element  //input[@data-id='optIn3']
    sleep     5
    wait_until_page_contains_element  //input[@data-id='optIn2']
    click element  //input[@data-id='optIn2']
    sleep     5
    wait_until_page_contains_element  //button[@data-id='goToNextStep']
    click element    //button[@data-id='goToNextStep']

Carte

    Wait Until Page Contains Element    //li[@class='TB0551']
    Click Element    //li[@class='TB0551']
    sleep     5

     wait_until_page_contains_element  //input[@data-input='owner']
     Input Text     //input[@data-input='owner']    123456789AF89
     sleep     5

     Wait Until Page Contains Element    //label[@for='National-60']    timeout=20s
     Click Element    //label[@for='National-60']
     sleep     5

     Wait Until Page Contains Element    //label[@for="01-61"]  timeout=5s
     Click Element    //label[@for='01-61']
     sleep     5

     Wait Until Page Contains Element    //label[@for="03-62"]  timeout=5s
     Click Element    //label[@for="03-62"]
     sleep     5

    Wait Until Page Contains Element    //label[@for='Liber-T-65 (18€-65 /-65 an)-65']
    Click Element    //label[@for='Liber-T-65 (18€-65 /-65 an)-65']
    sleep     5

     Wait Until Page Contains Element    //input[@data-input='pinCode']
    Input Text    //input[@data-input='pinCode']    1234
    sleep     5


    Wait Until Page Contains Element    //button[@name='gotoNextStep']
    Click Element    //button[@name='gotoNextStep']

Entreprise
     ${random_string}=    Generate Random String    10    [NUMBERS]
     wait_until_page_contains_element    //input[@data-input='companyNumber']
     Input Text    //input[@data-input='companyNumber']    ${random_string}
     sleep    5
     wait_until_page_contains_element    //input[@data-input='vatNumber']
     Input Text    //input[@data-input='vatNumber']    ${random_string}
     sleep    5
     wait_until_page_contains_element  //input[@data-input='companyName']
     Input Text      //input[@data-input='companyName']    CGI
     sleep     5
     wait_until_page_contains_element  //input[@data-input='addressStreet']
     Input Text      //input[@data-input='addressStreet']    Street
     sleep     5
     wait_until_page_contains_element   //input[@data-input='addressNumber']
     Input Text  //input [@data-input='addressNumber']  1
     sleep     5
     wait_until_page_contains_element   //input[@data-input='addressBox']
     Input Text  //input[@data-input='addressBox']  Box
     sleep     5
     wait_until_page_contains_element   //input[@data-input='postCode']
     Input Text      //input[@data-input='postCode']    1000
     sleep     5
     wait_until_page_contains_element   //ul[@class='autocomplete-container']//li [1]
     click element   //ul[@class='autocomplete-container']//li [1]
     sleep     5

     Wait Until Page Contains Element    //label[@for="MRS.-92"]  timeout=10s
     Click Element    //label[@for="MRS.-92"]
     sleep     5

     Wait Until Page Contains Element  //input[@data-input='firstName']
     Input Text      //input[@data-input='firstName']  yas
     sleep     5

     wait_until_page_contains_element  //button[@class='btn btn-primary']
     Click Element   //button[@class='btn btn-primary']
     sleep     5

     Wait Until Page Contains Element  //input[@data-input='lastName']
     Input Text      //input[@data-input='lastName']  yas
     sleep     5

     wait_until_page_contains_element  //button[@class='btn btn-primary']
     Click Element   //button[@class='btn btn-primary']
     sleep     5

     wait_until_page_contains_element  //select[@data-id='companyFunction']
     Select From List By Value    //select[@data-id='companyFunction']    DRH
     sleep     5

     Wait Until Page Contains Element  //input[@data-input='phoneNumber']
     Input Text      //input[@data-input='phoneNumber']  0666666666
     sleep     5

     wait_until_page_contains_element  //button[@class='btn btn-primary']
     Click Element   //button[@class='btn btn-primary']
     sleep     5

     Wait Until Page Contains Element  //input[@data-input='iban']
     Input Text      //input[@data-input='iban']   49519325843371

     Wait Until Page Contains Element        //button[@class='btn btn-primary']  timeout=20
     Click Element     //button[@class='btn btn-primary']
     Click Element     //*[@data-id="goToNextStep"]


Recapitulation
    sleep   3
    Wait Until Page Contains Element        //button[@class='m-btn m-btn--hollow']  timeout=20
    Click Element        //button[@class='m-btn m-btn--hollow']
    sleep  20
Contrat
    sleep  5
    Wait Until Page Contains Element   //label[@for='disclosureAccepted']  timeout=20
    Click Element   //label[@for='disclosureAccepted']
    sleep  5
    Wait Until Page Contains Element   (//button[contains(@class,'btn btn-main')])[3]   timeout=20
    Click Element   (//button[contains(@class,'btn btn-main')])[3]
    sleep  5

    #sig1
    Wait Until Page Contains Element   (//div[contains(@class,'signature-tab-content tab-button-yellow')])[1]   timeout=20
    Click Element     (//div[contains(@class,'signature-tab-content tab-button-yellow')])[1]
    sleep  5

    Wait Until Page Contains Element   (//button[contains(@class,'btn btn-lg')])[3]   timeout=20
    Click Element  (//button[contains(@class,'btn btn-lg')])[3]
    sleep  10
    #2
    Wait Until Page Contains Element   (//div[contains(@class,'signature-tab-content tab-button-yellow')])[2]   timeout=20
    Click Element     (//div[contains(@class,'signature-tab-content tab-button-yellow')])[2]
    sleep  5
    #3
    Wait Until Page Contains Element   (//div[contains(@class,'signature-tab-content tab-button-yellow')])[3]   timeout=20
    Click Element     (//div[contains(@class,'signature-tab-content tab-button-yellow')])[3]
    sleep  5
    #4
    Wait Until Page Contains Element   (//div[contains(@class,'signature-tab-content tab-button-yellow')])[4]   timeout=20
    Click Element     (//div[contains(@class,'signature-tab-content tab-button-yellow')])[4]

    sleep  5
    #5
    Wait Until Page Contains Element   (//div[contains(@class,'signature-tab-content tab-button-yellow')])[5]   timeout=20
    Click Element     (//div[contains(@class,'signature-tab-content tab-button-yellow')])[5]
    sleep  5

    Wait Until Page Contains Element  (//button[contains(@class,'documents-finish-button btn')])[1]   timeout=20
    Click Element     (//button[contains(@class,'documents-finish-button btn')])[1]
    sleep  5

    sleep  60
*** Keywords ***
Get Clipboard Content
    [Documentation]    Get the content of the clipboard
    ${content}=    Run Keyword And Return     Evaluate    pyperclip.paste()    # Utilise pyperclip pour obtenir le contenu du presse-papiers
    RETURN    ${content}
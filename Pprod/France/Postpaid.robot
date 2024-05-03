*** Settings ***
Library    SeleniumLibrary
Library    pyperclip
Library    Collections
Library    OperatingSystem
Library    String
Library    random

*** Variables ***
${urlEmail}   https://yopmail.com/fr/
${browser}    edge
${INPUT_XPATH}   //input[@title='Raison sociale']
${INPUT_VALUE}    CLUB  # Replace with the actual value you wish to enter
${spinner_xpath}    //lightning-spinner
@{valid_postal_codes}    75001    31000    44000    69001    13001    67000    33000   35000   59000   06000


*** Test Cases ***
Email
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

Parcour1
    Open Browser  https://diac--preprod.sandbox.my.site.com/mcfr/s/  ${browser}
    Maximize Browser Window

    sleep  3
    Wait Until Element Is Visible    xpath://button[text()='Souscrire à la carte Mobility Corporate']  timeout=20s
    Click Button    xpath://button[text()='Souscrire à la carte Mobility Corporate']

     sleep  3
     Wait Until Element Is Visible    xpath://button[contains(text(),'Démarrez votre souscription')]   timeout=20s
    Click Button    xpath://button[contains(text(),'Démarrez votre souscription')]

Cordonnee
    sleep  3
    Wait Until Element Is Visible   //input[@inputmode='text']    timeout=20
    Input Text    //input[@inputmode='text']   CLUB

    sleep  3
    ${index}=    Evaluate    random.randint(0, ${valid_postal_codes.__len__()} - 1)
    ${postal_code}=    Set Variable    ${valid_postal_codes}[${index}]
    Wait Until Element Is Visible       //input[@inputmode='numeric']  timeout=20
    Input Text   //input[@inputmode='numeric']   ${postal_code}

    sleep  3
    Wait Until Element Is Visible   //div[@class='next-step-section']//button[1]  timeout=20
    Click Element  //div[@class='next-step-section']//button[1]

    sleep  5
    ${list_length}=    Get Element Count    //p[@class='companyNameSelection']
    ${index}=    Evaluate    random.randint(1, ${list_length})

    ${company_name}    Get Text    (//p[@class='companyNameSelection'])[${index}]
    ${company_address}    Get Text    (//p[@class='companyAdressSelection'])[${index}]
    ${select_button}    Get WebElement    (//span[text()='Sélectionner'])[${index}]

    # Printing company details
    Log    Company Name: ${company_name}
    Log    Company Address: ${company_address}

    Click Element    ${select_button}

    sleep  3
    Wait Until Element Is Visible  //button[text()='Je confirme mes informations']   timeout=20
    Click Element   //button[text()='Je confirme mes informations']

    sleep  3
    Wait Until Element Is Visible   //label[@class='radio-button km-btns']  timeout=20
    Click Element  //label[@class='radio-button km-btns']

    sleep  3
    Wait Until Element Is Visible   //label[@class='radio-button km-btns']  timeout=20
    Click Element  //label[@class='radio-button km-btns']

    sleep  3
    Wait Until Element Is Visible   (//label[@class='radio-button salutation-btns'])[2]  timeout=20
    Click Element  (//label[@class='radio-button salutation-btns'])[2]

    sleep  3
    Wait Until Element Is Visible   (//input[@inputmode='text'])[1]  timeout=20
    Input Text  (//input[@inputmode='text'])[1]  yasm
    Wait Until Element Is Visible   (//input[@inputmode='text'])[2]  timeout=20
    Input Text  (//input[@inputmode='text'])[2]  mary

    sleep  3
    Wait Until Element Is Visible    (//span[@class='slds-truncate'])[1]  timeout=20
    Click Element    (//span[@class='slds-truncate'])[1]
    Click Element   (//span[text()='Comptable'])[1]

    sleep  3
    Wait Until Element Is Visible    //button[text()='Je confirme mes informations']  timeout=20
    Click Element    //button[text()='Je confirme mes informations']

    sleep  3
    Wait Until Element Is Visible   //input[@inputmode='text']   timeout=20
    ${clipboard_content}=    Get Clipboard Content
    Input Text    //input[@inputmode='text']    ${clipboard_content}

    Wait Until Element Is Visible   (//input[@inputmode='numeric'])[1]   timeout=20
    Input Text   (//input[@inputmode='numeric'])[1]   0666666666

    sleep  3
    Wait Until Element Is Visible    //button[text()='Je confirme mes informations']  timeout=20
    Click Element    //button[text()='Je confirme mes informations']

    sleep  5
    Wait Until Element Is Visible    //button[text()='Ignorer cette étape']  timeout=20
    Click Element    //button[text()='Ignorer cette étape']


Besoins
    sleep  3
    Wait Until Element Is Visible   //button[@data-id='plus']  timeout=20
    Click Element   //button[@data-id='plus']

    sleep  3
    Wait Until Element Is Visible   (//input[@inputmode='numeric'])[1]   timeout=20
    Input Text  (//input[@inputmode='numeric'])[1]   150

    sleep  3
    Wait Until Element Is Visible   (//input[@inputmode='numeric'])[2]  timeout=20
    Input Text  (//input[@inputmode='numeric'])[2]   150

    Wait Until Element Is Visible   //button[@class='next-step-button icon-button']  timeout=20
    Click Element   //button[@class='next-step-button icon-button']
    sleep  3

    Wait Until Element Is Visible    (//span[@class='slds-truncate'])[1]  timeout=20
    Click Element    (//span[@class='slds-truncate'])[1]
    Wait Until Element Is Visible   //span[text()='Professionnel B2B (personne physique, entrepreneur individuel, auto-entrepreneur, agent commercial, artisan)']
    Click Element   //span[text()='Professionnel B2B (personne physique, entrepreneur individuel, auto-entrepreneur, agent commercial, artisan)']

    sleep  3
    Wait Until Element Is Visible    (//input[@inputmode='numeric'])[1]   timeout=20
    Input Text   (//input[@inputmode='numeric'])[1]  5
    Wait Until Element Is Visible    (//input[@inputmode='numeric'])[2]   timeout=20
    Input Text   (//input[@inputmode='numeric'])[2]  100000

    sleep  3
    Wait Until Element Is Visible   //div[@class='next-step-section']//button[1]   timeout=20
    Click Element  //div[@class='next-step-section']//button[1]
Carte
    sleep  3
   # Wait until the spinner disappears
    Wait Until Element Is Not Visible    ${spinner_xpath}    timeout=20s

    # Click the element once the spinner disappears
    Wait Until Element Is Visible   //div[text()='Créer une nouvelle carte']/following-sibling::img   timeout=20
    Click Element  //div[text()='Créer une nouvelle carte']/following-sibling::img

    sleep  3
    Wait Until Element Is Visible   (//input[@inputmode='text'])[3]   timeout=20
    Input Text  (//input[@inputmode='text'])[3]  adresse

    sleep  3
    Wait Until Element Is Visible   (//input[@inputmode='numeric'])[2]   timeout=20
    Input Text   (//input[@inputmode='numeric'])[2]   35000

    sleep  3
    Wait Until Element Is Visible    (//input[@inputmode='text'])[4]
    Input Text    (//input[@inputmode='text'])[4]    RENNES

    Wait Until Element Is Visible   (//button[@class='next-step-button'])[1]  timeout=20
    Click Element  (//button[@class='next-step-button'])[1]

    sleep  3

    Wait Until Element Is Visible   (//input[@type='radio'])[1]  timeout=20
    Click Element  (//input[@type='radio'])[1]
    sleep  3

    Wait Until Page Contains Element    (//span[@class='slds-truncate'])[1]  timeout=20
    Click Element    (//span[@class='slds-truncate'])[1]
    Wait Until Page Contains Element    (//span[text()='Tous Carburants'])[1]  timeout=20
    Click Element   (//span[text()='Tous Carburants'])[1]

    sleep  3
    Wait Until Page Contains Element    xpath=(//button[@name='services'])[1]  timeout=20
    Click Element   xpath=(//button[@name='services'])[1]
    Wait Until Page Contains Element    (//span[text()='Tous services'])[1]  timeout=20
    Click Element   (//span[text()='Tous services'])[1]

    sleep  3
    Wait Until Page Contains Element     //input[@inputmode='text']   timeout=20
    Input Text     //input[@inputmode='text']    CARTE12

    sleep  3
    Wait Until Page Contains Element    (//label[@class='radio-button km-btns'])[2]  timeout=20
    Click Element   (//label[@class='radio-button km-btns'])[2]



     FOR    ${i}    IN RANGE        7
        ${exception_occurred}=    Run Keyword And Return Status
        ...    Click Element    //div[@class='next-step-section']//button[1]
        Run Keyword If    '${exception_occurred}' and ${i} < 6
        ...    Sleep    3s
     END
     sleep  5
Bancaire
    sleep  5
    Wait Until Page Contains Element    //input[@inputmode='text']  timeout=30
    Input Text   //input[@inputmode='text']   FR5412739000401226494985G35

    Wait Until Page Contains Element    //div[@class='next-step-section']//button[1]  timeout=20
    Click Element   //div[@class='next-step-section']//button[1]


Recap
    Wait Until Element Is Visible    (//button[@class='next-step-button'])[1]  timeout=20
    Click Element    (//button[@class='next-step-button'])[1]
    sleep  5
    Wait Until Element Is Visible    //div[@class='next-step-section']//button[1]   timeout=20
    Click Element    //div[@class='next-step-section']//button[1]


    sleep  20

*** Keywords ***
Get Clipboard Content
    [Documentation]    Get the content of the clipboard
    ${content}=    Run Keyword And Return     Evaluate    pyperclip.paste()    # Utilise pyperclip pour obtenir le contenu du presse-papiers
    RETURN    ${content}
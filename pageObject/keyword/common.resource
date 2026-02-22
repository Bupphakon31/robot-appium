*** Settings *** 
Library    AppiumLibrary
Library    OperatingSystem    

*** Variables *** 
${Hamburger_burger_menu}    accessibility_id=open menu
${Login_menu}    //*[@content-desc="menu item log in"]
${EXPECTED_LOGIN_PAGE}    ${NONE}

*** Keywords *** 
Open Hamburger Menu
    Click Element    ${Hamburger_burger_menu}

Click Login menu
    Click Element    ${Login_menu}

Load Expected Data
    [Documentation]    Load expected values from any YAML file path.
    [Arguments]    ${yaml_path}
    ${content}=    Get File    ${yaml_path}
    ${data}=    Evaluate    __import__('yaml').safe_load('''${content}''')
    RETURN    ${data}

Setup Expected Page Data
    ${all_expected}=    Load Expected Data    ${CURDIR}/../../resources/expected/login_page.yml
    ${login_expected}=  Set Variable    ${all_expected}[login_page]
    Set Suite Variable  ${EXPECTED_LOGIN_PAGE}    ${login_expected}
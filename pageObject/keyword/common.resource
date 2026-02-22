*** Settings *** 
Library    AppiumLibrary

*** Variables *** 
${Hamburger_burger_menu}    accessibility_id=open menu


*** Keywords *** 
Open Hamburger Menu
    Click Element    ${Hamburger_burger_menu}
*** Settings ***
Resource   Variables.robot

*** Keywords ***
Open Firefox Browser with poczta.o2.pl
   Open Browser   ${o2-url}   ${Firefox}
   Maximize Browser Window
   Wait Until Element Is Visible   ${login-btn}   timeout=60   error=poczta.o2.plSiteNotFound!

Open Firefox-Headless Browser with poczta.o2.pl
   Open Browser   ${o2-url}   ${Firefox-Headless}
   Maximize Browser Window
   Wait Until Element Is Visible   ${login-btn}   timeout=60   error=poczta.o2.plSiteNotFound!

Open Chrome Browser with poczta.o2.pl
   Open Browser   ${o2-url}   ${Chrome}
   Maximize Browser Window
   Wait Until Element Is Visible   ${login-btn}   timeout=60   error=poczta.o2.plSiteNotFound!

Open Chrome-Headless Browser with poczta.o2.pl
   Open Browser   ${o2-url}   ${Chrome-Headless}
   Maximize Browser Window
   Wait Until Element Is Visible   ${login-btn}   timeout=60   error=poczta.o2.plSiteNotFound!

Close Browser
   Close All Browsers

Set Browser Window to 1900x1080
   Set Window Size   1900   1080

Logging to poczta.o2.pl e-mail
   Wait Until Element Is Visible   ${login-field}   timeout=60   error=MailButtonNotFound!
   Input Text   ${login-field}   ${login}   clear=True
   Input Text   ${pass-field}   ${password}   clear=True
   Click Button   ${login-btn}
   Wait Until Element Is Visible   ${writeEmail-btn}   timeout=60   error=WriteMailButtonNotFound!
   ${isSelectAllVisible}=   Run Keyword And Return Status   Element Should Be Visible   ${emailSelectAll}
   Run Keyword If   ${isSelectAllVisible}>0   Deleting spam
   ${isConfirmNeeded}=   Run Keyword And Return Status   Element Should Be Visible   ${emailConfirmDelete}
   Run Keyword If   ${isConfirmNeeded}>0   Confirm deleting of spam

Logging to poczta.o2.pl e-mail with invalid login
   Wait Until Element Is Visible   ${login-field}   timeout=60   error=MailButtonNotFound!
   Input Text   ${login-field}   ${loginInvalid}   clear=True
   Input Text   ${pass-field}   ${password}   clear=True
   Click Button   ${login-btn}
   Wait Until Element Is Visible   ${login-error-message}   timeout=60   error=WriteMailButtonNotFound!
   Page Should Contain   Podany login i/lub hasło są nieprawidłowe.

Logging to poczta.o2.pl e-mail with invalid password
   Wait Until Element Is Visible   ${login-field}   timeout=60   error=MailButtonNotFound!
   Input Text   ${login-field}   ${login}   clear=True
   Input Text   ${pass-field}   ${passwordInvalid}   clear=True
   Click Button   ${login-btn}
   Wait Until Element Is Visible   ${login-error-message}   timeout=60   error=WriteMailButtonNotFound!
   Page Should Contain   Spróbuj jeszcze raz.

Deleting spam
   Wait Until Element Is Visible   ${emailSelectAll}   timeout=60   error=SelectAllButtonNotFound!
   Click Element   ${emailSelectAll}
   Wait Until Element Is Visible   ${emailDeleteAll}   timeout=60   error=DeleteAllButtonNotFound!
   Click Button   ${emailDeleteAll}

Confirm deleting of spam
   Wait Until Element Is Visible   ${emailConfirmDelete}   timeout=60   error=ConfirmDeleteButtonNotFound!
   Click Button   ${emailConfirmDelete}

Logging out of poczta.o2.pl e-mail
   Wait Until Element Is Visible   ${options-btn}   timeout=60   error=OptionsButtonNotFound!
   Click Button   ${options-btn}
   Wait Until Element Is Visible   ${logout-btn}   timeout=60   error=LogountButtonNotFound!
   Sleep   1s
   Click Button   ${logout-btn}
   Wait Until Element Is Visible   ${loginAgain-btn}   timeout=60   error=LoginAgainButtonNotFound!

Writing an e-mail message to yourself
    Click Button   ${writeEmail-btn}
    Wait Until Element Is Visible   ${emailTo-field}   timeout=60   error=EmailToFieldNotFound!
    Input Text   ${emailTo-field}   ${EmailTo-text}   clear=True
    Input Text   ${emailTopic-field}   ${EmailTopic-text}   clear=True
    Input Text   ${emailContent-field}   ${EmailContent-text}   clear=True
    Wait Until Element Is Visible   ${emailSend-btn}   timeout=60   error=EmailSendButtonNotFound!
    Sleep   1s
    Click Button   ${emailSend-btn}
    Wait Until Element Is Visible   ${emailUnread-icon}   timeout=60   error=UnreadIconNotFound!
    Wait Until Element Is Visible   ${emailRefresh}   timeout=60   error=EmailRefreshButtonNotFound!
    Sleep   2s
    Click Button   ${emailRefresh}
    Wait Until Element Is Visible   ${emailTest}   timeout=60   error=TestEmailNotFound!


Reading and deleting an e-mail message wrote to yourself
   Wait Until Element Is Visible   ${emailTest}   timeout=60   error=TestEmailNotFound!
   Click Element   ${emailTest}
   Wait Until Element Is Visible   ${emailContentCheck}   timeout=60   error=EmailContentNotFound!
   Click Button   ${emailDelete-btn}
   Wait Until Element Is Visible   ${emailEmptyCheck}   timeout=60   error=EmailEmpyCheckFailed!
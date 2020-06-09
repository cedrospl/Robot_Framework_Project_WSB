*** Variables ***
${Firefox}=   Firefox
${Firefox-Headless}=   HeadlessFirefox
${Chrome}=   Chrome
${Chrome-Healdess}=   HeadlessChrome
${o2-url}=   https://poczta.o2.pl/
${login}=   testertestowy@o2.pl
${password}=   testowe!0!
${EmailTo-text}=   testertestowy@o2.pl
${EmailTopic-text}=   Test mail
${EmailContent-text}=   Test content

${login-field}=   id:login
${pass-field}=   css:input[name="password"]
${login-btn}=   id:login-button
${options-btn}=   css:button[class="Button Button-options"]
${logout-btn}=   css:button[id="Logout-Button"]
${loginAgain-btn}=   xpath://a[@href="https://poczta.o2.pl/zaloguj"]
${writeEmail-btn}=   css:button[class="sc-rBLzX kIXgTz"]
${emailTo-field}=   css:input[class="sc-eMigcr cbicRj"]
${emailTopic-field}=   css:input[class="sc-kAzzGY joSAJF"]
${emailContent-field}=   css:div[class="DraftEditor-editorContainer"]
${emailSend-btn}=   css:button[type="submit"]
${emailUnread-icon}=   css:div[class="sidebar__number"]
${emailRefresh}=   css:button[aria-label="Odśwież listę wiadomości"]
${emailTest}=   css:div[class="stream-item__data flex flex-max"]
${emailContentCheck}=   xpath://div[text()="Test content"]
${emailDelete-btn}=   css:button[data-sel-elem="delete_button"]
${emailEmptyCheck}=   xpath://div[text()="Folder Odebrane jest pusty"]
${emailSelectAll}=   css:li[ng-click="ListDirectiveController.setSelection('all');"]
${emailDeleteAll}=   css:button[ng-click="ListDirectiveController.remove()"]
${emailConfirmDelete}=   css:button[class="Button Button--cta"]
*** Settings ***
Library   SeleniumLibrary
Resource   Keywords.robot

*** Test Cases ***
Opening Firefox Browser with site poczta.o2.pl
   Open Firefox Browser with poczta.o2.pl
   Close Browser

Logging in to poczta.o2.pl e-mail and logging out
   Open Firefox Browser with poczta.o2.pl
   Logging to poczta.o2.pl e-mail
   Logging out of poczta.o2.pl e-mail
   Close Browser

Sending an e-mail to yourself, deleting it and logging out
   Open Firefox Browser with poczta.o2.pl
   Logging to poczta.o2.pl e-mail
   Writing an e-mail message to yourself
   Reading and deleting an e-mail message wrote to yourself
   Logging out of poczta.o2.pl e-mail
   Close Browser
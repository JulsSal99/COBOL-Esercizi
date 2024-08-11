       IDENTIFICATION DIVISION.
       PROGRAM-ID.       RUBRICA.
       AUTHOR.       Giulio.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Num       PIC 9(2) VALUE 1.
       01 PIValue CONSTANT AS 3.14.
       01 SignedInt        PIC S9(3) VALUE -123. *> S è signed
       01 Paga        PIC 9(4)V99 VALUE ZEROS.
       01 Costumer.
           02 Indent       PIC 9(3).
           02 CustName       PIC X(20).
           02 DateOfBirth.
                  03 BDay       PIC 99.
                  03 SLASH        PIC X(1) VALUE "/".
                  03 BMONTH       PIC 99.
                  03 SLASH       PIC X(1) VALUE "/".
                  03 BYEAR       PIC 9999.
       PROCEDURE DIVISION.
           MOVE 9.13 TO Paga.
           MOVE "123Giu Salad           02/08/1999" TO Costumer.
           PERFORM 10 TIMES
                  DISPLAY "Valore: " Num
                  COMPUTE Num = Num + 1
                  *> AHAHA, COMMENTO!
           END-PERFORM.
           DISPLAY "Pi greco = " PIValue " Numero negativo = " 
           SignedInt " Paga = " Paga.
           DISPLAY CUSTNAME, DateOfBirth.

           MOVE ZERO TO CUSTNAME.
           DISPLAY CUSTNAME.
           MOVE SPACE TO CUSTNAME.
           DISPLAY CUSTNAME.
           MOVE HIGH-VALUE TO CUSTNAME.
           DISPLAY CUSTNAME.
           MOVE LOW-VALUE TO CUSTNAME.
           DISPLAY CUSTNAME.
           MOVE QUOTE TO CUSTNAME.
           DISPLAY CUSTNAME.
           MOVE ALL "2" TO CUSTNAME.
           DISPLAY CUSTNAME.
       STOP RUN.
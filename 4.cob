       IDENTIFICATION DIVISION.
       PROGRAM-ID.       RUBRICA.
       AUTHOR.       Giulio.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Num       PIC 9(2) VALUE 1.
       PROCEDURE DIVISION.
           DISPLAY "INCREMENTO: ".
           DISPLAY "Valore iniziale: " Num NO ADVANCING.
           COMPUTE Num = Num + 10.
           DISPLAY ". Valore finale: " Num.
           COMPUTE Num ROUNDED = 3.0 + 2.005.
           DISPLAY ". Valore finale arrotondato: " Num.
       STOP RUN.
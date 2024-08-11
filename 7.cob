       IDENTIFICATION DIVISION.
       PROGRAM-ID.       ESAME.
       AUTHOR.       Giulio.
       DATE-WRITTEN.20/07/2024
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS PassingScore IS "A" THRU "C", "D".
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Score    PIC X(1) VALUE "B".
       01 TestNumber    PIC X.
           88 IsPrime    VALUE "1", "3", "5", "7".
           88 IsOdd    VALUE "1", "3", "5", "7", "9".
           88 IsEven    VALUE "2", "4", "6", "8".
           88 LessThan5    VALUE "1" THRU "4".
           88 ANumber    VALUE "0" THRU "9".
       PROCEDURE DIVISION.
           DISPLAY "Inserisci un numero a singola cifra"
           " o X per uscire: " NO ADVANCING
           ACCEPT TestNumber
           PERFORM UNTIL NOT ANumber
               EVALUATE TRUE
                   WHEN IsPrime DISPLAY "Primo"
                   WHEN IsOdd DISPLAY "Odd"
                   WHEN IsEven DISPLAY "Even"
                   WHEN OTHER DISPLAY "Default Action"
               END-EVALUATE
               IF LessThan5 DISPLAY "Piu' piccolo di 5"
               END-IF
               DISPLAY "Inserisci un numero a singola cifra"
               " o X per uscire: " NO ADVANCING
               ACCEPT TestNumber
           END-PERFORM.
           
           *> CLASSI
           IF Score IS PassingScore THEN
               DISPLAY "Hai passato l'esame!"
           ELSE
               DISPLAY "Hai passato l'esame!"
           END-IF
                   
       STOP RUN.
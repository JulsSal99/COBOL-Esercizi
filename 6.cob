       IDENTIFICATION DIVISION.
       PROGRAM-ID.       VOTE.
       AUTHOR.       Giulio.
       DATE-WRITTEN.20/07/2024
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Age    PIC 99 VALUE 0.
       01 Grade    PIC 99 VALUE 0.
       01 CanVoteFlag    PIC 9 VALUE 0.
           88 CanVote    VALUE 1.    *> 88 è una condizione
           88 CantVote    VALUE 0.
       PROCEDURE DIVISION.
           DISPLAY "Enter Age : " WITH NO ADVANCING.
           ACCEPT AGE.
           IF Age > 18 THEN
               SET CanVote TO TRUE
           ELSE
               SET CantVote TO TRUE
           END-IF.
           
           IF CanVoteFlag = 1
               DISPLAY "Puoi votare!"
           ELSE 
               DISPLAY "Non puoi votare!" 

           IF Age LESS THAN 5 THEN
               DISPLAY "Stai a casa"
           END-IF.
           IF AGE > 5 AND Age < 18 THEN
               COMPUTE Grade = Age - 5
               DISPLAY "Go to Grade " Grade
           END-IF.
           *> IF Age GREATER THAN OR EQUAL
           *> IF Age IS NOT NUMERIC THEN
                   
       STOP RUN.
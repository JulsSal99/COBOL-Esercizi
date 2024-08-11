       IDENTIFICATION DIVISION.
       PROGRAM-ID.       SUBROUTINES.
       AUTHOR.       Giulio.
       DATE-WRITTEN.22/07/2024
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Ind    PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM OutputData WITH TEST AFTER UNTIL Ind > 5
               GO TO ForLoop.
           OutputData.
               DISPLAY Ind WITH NO ADVANCING.
               ADD 1 TO Ind.
           ForLoop.
               PERFORM OutputData2 VARYING Ind FROM 1 BY 1 UNTIL Ind = 5
               DISPLAY " ".
               STOP RUN.
           OutputData2.
               DISPLAY Ind WITH NO ADVANCING.
       STOP RUN.
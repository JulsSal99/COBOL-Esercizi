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
       01 Num1    PIC 9 VALUE 5.
       01 Num2    PIC 9 VALUE 4.
       01 Sum1    PIC 99.

       PROCEDURE DIVISION.
           CALL 'GETSUM' USING Num1, Num2, Sum1.
           DISPLAY Num1 " + "  Num2 " = " Sum1.
       STOP RUN.
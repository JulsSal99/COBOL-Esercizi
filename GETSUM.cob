       IDENTIFICATION DIVISION.
       PROGRAM-ID.       GETSUM.
       AUTHOR.       Giulio.
       DATE-WRITTEN.22/07/2024
       DATA DIVISION.
       LINKAGE SECTION.
       01 LNum1    PIC 9 VALUE 0.
       01 LNum2    PIC 9 VALUE 0.
       01 LSum    PIC 99.
       PROCEDURE DIVISION USING LNum1, LNum2, LSum.
           COMPUTE LSum = LNum1 + LNum2.
       EXIT PROGRAM.
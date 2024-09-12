       IDENTIFICATION DIVISION.
       PROGRAM-ID. StudentEntry.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 WS-STUDENT-ID     PIC 9(5).
       77 WS-STUDENT-NAME   PIC X(20).
       77 WS-STUDENT-ADDRESS PIC X(30).

       SCREEN SECTION.
       01 STUDENT-ENTRY-SCREEN.
          05 LINE 1  COLUMN 10 VALUE "Student Entry Form".
          05 LINE 3  COLUMN 10 VALUE "Enter Student ID :".
          05 LINE 3  COLUMN 30 PIC 9(5) TO WS-STUDENT-ID.
          05 LINE 4  COLUMN 10 VALUE "Enter Student Name :".
          05 LINE 4  COLUMN 30 PIC X(20) TO WS-STUDENT-NAME.
          05 LINE 5  COLUMN 10 VALUE "Enter Student Address :".
          05 LINE 5  COLUMN 30 PIC X(30) TO WS-STUDENT-ADDRESS.
          05 LINE 7  COLUMN 10 VALUE "Press ENTER to submit...".

       01 CONFIRMATION-SCREEN.
          05 LINE 1  COLUMN 10 VALUE "Student Information Confirmation".
          05 LINE 3  COLUMN 10 VALUE "Student ID      :".
          05 LINE 3  COLUMN 30 PIC 9(5) FROM WS-STUDENT-ID.
          05 LINE 4  COLUMN 10 VALUE "Student Name    :".
          05 LINE 4  COLUMN 30 PIC X(20) FROM WS-STUDENT-NAME.
          05 LINE 5  COLUMN 10 VALUE "Student Address :".
          05 LINE 5  COLUMN 30 PIC X(30) FROM WS-STUDENT-ADDRESS.
          05 LINE 7  COLUMN 10 VALUE "Press ENTER to exit...".

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY STUDENT-ENTRY-SCREEN.
           ACCEPT STUDENT-ENTRY-SCREEN.

           DISPLAY CONFIRMATION-SCREEN.
           ACCEPT CONFIRMATION-SCREEN.

           STOP RUN.

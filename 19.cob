       IDENTIFICATION DIVISION.
       PROGRAM-ID.       SQLCA.
       AUTHOR.       Giulio.
       DATE-WRITTEN.00/00/0000
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       EXEC SQL
           INCLUDE SQLCA
       END-EXEC.   *> SQLCA Indica al programma se un'esecuzione è andata 
                   *> a buon fine o meno.
       
       EXEC SQL
           INCLUDE STUDENT
       END-EXEC.
       
       EXEC SQL BEGIN DECLARE SECTION
       END-EXEC.

       01 WS-STUDENT-REC.
           05 WS-STUDENT-ID PIC 9(4).
           05 WS-STUDENT-NAME PIC X(25).
           05 WS-STUDENT-ADDRESS X(50).

       EXEC SQL END DECLARE SECTION
       END-EXEC.
       
       PROCEDURE DIVISION.
       MOVE 1005 TO WS-STUDENT-ID.
       MOVE 'TutorialsPoint' TO WS-STUDENT-NAME.
       MOVE 'Hyderabad' TO WS-STUDENT-ADDRESS.
           *> dichiara SQLCA.
       EXEC SQL
           SELECT STUDENT-ID, STUDENT-NAME, STUDENT-ADDRESS
           INTO :WS-STUDENT-ID, :WS-STUDENT-NAME, WS-STUDENT-ADDRESS 
               FROM STUDENT
           WHERE STUDENT-ID=1004

           INSERT INTO STUDENT(STUDENT-ID, STUDENT-NAME, STUDENT-ADDRESS) 
           VALUES (:WS-STUDENT-ID, :WS-STUDENT-NAME, WS-STUDENT-ADDRESS)
           
           UPDATE STUDENT SET STUDENT-ADDRESS=:WS-STUDENT-ADDRESS
           WHERE STUDENT-ID = 1003

           DELETE FROM STUDENT
           WHERE STUDENT-ID=:WS-STUDENT-ID
       END-EXEC.
       
           IF SQLCODE = 0  *> controlla se sono avvenuti eventuali errori
               DISPLAY WS-STUDENT-REC
           ELSE 
               DISPLAY 'Error'
           END-IF.
       STOP RUN.
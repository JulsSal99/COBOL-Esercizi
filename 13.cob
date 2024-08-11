       IDENTIFICATION DIVISION.
       PROGRAM-ID.       FILES.
       AUTHOR.       Giulio.
       DATE-WRITTEN.22/07/2024
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CostumerFIle ASSIGN TO "13.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS IS SEQUENTIAL.
       *> VA RIMOSSO: CONFIGURATION SECTION, SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       FD CostumerFile.
       01 CostumerData.
           02 IDNum    Pic 9(5).
           02 CustName.
               03 Name PIC X(15).
               03 LastName PIC X(15).
       WORKING-STORAGE SECTION.
       01 WSCostumerData.
           02 WSIDNum    Pic 9(5).
           02 WSCustName.
               03 WSName PIC X(15).
               03 WSLastName PIC X(15).
       01 WSEOF PIC A(1). *> è necessario per OPEN INPUT, non EXTEND
       PROCEDURE DIVISION.
           *> OUTPUT: se il file esiste già, viene sovrascritto.
           *> EXTEND: nuovi dati verranno aggiunti alla fine. Se il 
           *>         file non esiste, lo crea.
           *> INPUT:  solo lettura.
           OPEN EXTEND COSTUMERFILE.
               MOVE 00001 TO IDNum.
               MOVE 'Giulio' TO Name.
               MOVE 'S' TO LastName.
               WRITE COSTUMERDATA
               END-WRITE.

               DISPLAY "Customer ID: " WITH NO ADVANCING
               ACCEPT IDNum.
               DISPLAY "Customer First Name: " WITH NO ADVANCING
               ACCEPT Name.
               DISPLAY "Customer Last Name: " WITH NO ADVANCING
               ACCEPT LastName.
               WRITE COSTUMERDATA
               END-WRITE.
           CLOSE COSTUMERFILE.

           OPEN INPUT COSTUMERFILE.
               PERFORM UNTIL WSEOF='Y'
                   READ COSTUMERFILE INTO WSCostumerData
                       AT END MOVE 'Y' TO WSEOF
                       NOT AT END DISPLAY WSCostumerData
                    END-READ
                END-PERFORM
           CLOSE COSTUMERFILE.
       STOP RUN.
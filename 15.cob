       IDENTIFICATION DIVISION.
       PROGRAM-ID.       indexed-Access-Data.
       AUTHOR.       Giulio.
       DATE-WRITTEN.07/08/2024
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CostumerReport ASSIGN TO "15CustReport.rpt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CustomerFIle ASSIGN TO "15costumer.txt"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS IDNum.
       DATA DIVISION.
       FILE SECTION.
       FD CustomerFIle.
       01 CustomerData.
           02 IDNum    Pic 99.
           02 FirstName PIC X(15).
           02 LastName PIC X(15).

       WORKING-STORAGE SECTION.
       01 Choice PIC 9.
       01 StayOpen PIC X VALUE 'Y'.
       01 CustExists PIC X.

       PROCEDURE DIVISION.
           StartPara.
               OPEN I-O CustomerFIle.
               PERFORM UNTIL StayOpen = 'N'
                   DISPLAY " "
                   DISPLAY "CUSTOMER RECORDS"
                   DISPLAY "1 : Add Customer"
                   DISPLAY "2 : Delete Customer"
                   DISPLAY "3 : Update Customer"
                   DISPLAY "4 : Get Customer"
                   DISPLAY "0 : Quit"
                   DISPLAY ": " WITH NO ADVANCING
                   ACCEPT Choice
                   EVALUATE Choice
                       WHEN 1 PERFORM AddCust
                       WHEN 2 PERFORM DeleteCust
                       WHEN 3 PERFORM UpdateCust
                       WHEN 4 PERFORM GetCust
                       WHEN OTHER move 'N' TO StayOpen
                   END-EVALUATE
                END-PERFORM
               CLOSE CustomerFIle.
           STOP RUN.
           
           AddCust.
               DISPLAY " "
               DISPLAY "Enter ID : " WITH NO ADVANCING
               ACCEPT IDNum.
               DISPLAY "Enter First Name : " WITH NO ADVANCING
               ACCEPT FirstName.
               DISPLAY "Enter LastName : " WITH NO ADVANCING
               ACCEPT LastName.
               WRITE CustomerData
                   INVALID KEY DISPLAY "ID Taken"
               END-WRITE.

           DeleteCust.
               DISPLAY " "
               DISPLAY "Enter Customer ID to Delete : " WITH NO 
               ADVANCING.
               ACCEPT IDNum.
               DELETE CustomerFile
                   INVALID KEY DISPLAY "Key doesn't exist"
               END-DELETE.

           UpdateCust.
               MOVE 'Y' TO CustExists.
               DISPLAY " "
               DISPLAY "Enter ID to Update : " WITH NO ADVANCING.
               ACCEPT IDNum.
               READ CustomerFile
                   INVALID KEY MOVE 'N' TO CustExists
               END-READ
               IF CustExists='N'
                   DISPLAY "Customer doesn't exist"
               ELSE
                   DISPLAY "Enter the New First Name : " WITH NO 
                   ADVANCING.
                   ACCEPT FirstName
                   DISPLAY "Enter the New Last Name : " WITH NO 
                   ADVANCING.
                   ACCEPT LastName
               *> END-IF.
               REWRITE CustomerData
                   INVALID KEY DISPLAY "Customer Not Updated"
               END-REWRITE.
           
           GetCust.
               MOVE 'Y' TO CustExists.
               DISPLAY " "
               DISPLAY "Enter Customer ID to Find : " WITH NO ADVANCING.
               ACCEPT IDNum.
               READ CustomerFile
                   INVALID KEY MOVE 'N' TO CustExists
               END-READ
               IF CustExists='N'
                   DISPLAY "Customer doesn't exists"
               ELSE
                   DISPLAY "ID : " IDNum
                   DISPLAY "First Name : " FirstName
                   DISPLAY "Last Name : " LastName
               END-IF.

           

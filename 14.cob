       IDENTIFICATION DIVISION.
       PROGRAM-ID.       FILES.
       AUTHOR.       Giulio.
       DATE-WRITTEN.06/08/2024
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CostumerReport ASSIGN TO "CustReport.rpt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CostumerFIle ASSIGN TO "14.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD CostumerReport.
       01 PrintLine PIC X(44).

       FD CostumerFile.
       01 CostumerData.
           02 IDNum    Pic 9(5).
           02 CustName.
               03 FirstName PIC X(15).
               03 LastName PIC X(15).
           88 WSEOF VALUE HIGH-VALUE.

       WORKING-STORAGE SECTION.
       01 PageHeading.
           02 FILLER PIC X(13) VALUE "Costumer List".
       01 PageFooting.
           02 FILLER PIC X(13) VALUE SPACE.
           02 FILLER PIC X(7) VALUE "Page : ".
           02 PrnPageNum PIC Z9.
       01 Heads PIC X(36) VALUE "IDNum    FirstName    LastName".
       01 CostumerDetailLine.
           02 FILLER PIC X VALUE SPACE.
           02 PrnCustID PIC 9(5).
           02 FILLER PIC X(4) VALUE SPACE.
           02 PrnFirstName PIC X(15).
           02 FILLER PIC XX VALUE SPACE.
           02 PrnLastName PIC X(15).
       01 ReportingFooting PIC X(13) VALUE "END OF REPORT".
       01 LineCount PIC 99 VALUE ZERO.
           88 NewPageRequired VALUE 40 THRU 99.
       01 PageCount PIC 99 VALUE ZERO.

       PROCEDURE DIVISION.
           OPEN INPUT CostumerFIle.
           
           OPEN OUTPUT CostumerReport.
           PERFORM PrintPageHeading
           READ CostumerFIle
               AT END SET WSEOF TO TRUE
           END-READ
           PERFORM PrintReportBody UNTIL WSEOF
           WRITE PrintLine FROM ReportingFooting AFTER ADVANCING 5
           LINES
           CLOSE COSTUMERFILE, COSTUMERREPORT.
           STOP RUN.

           PrintPageHeading.
           WRITE PrintLine FROM PageHeading AFTER ADVANCING PAGE
           WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES
           MOVE 3 TO LineCount
           ADD 1 TO PageCount.

           PrintReportBody.
           IF NEWPAGEREQUIRED
               MOVE PageCount TO PrnPageNum
               WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
               PERFORM PrintPageHeading
           END-IF
           MOVE IDNum TO PrnCustID
           MOVE FirstName TO PrnFirstName
           MOVE LastName TO PrnLastName
           WRITE PrintLine FROM CostumerDetailLine AFTER ADVANCING 1
           LINE
           ADD 1 TO LineCount
           READ CostumerFile
               AT END SET WSEOF To TRUE
       END-READ.

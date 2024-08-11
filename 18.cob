       IDENTIFICATION DIVISION.
       PROGRAM-ID.       sort-records.
       AUTHOR.       Giulio.
       DATE-WRITTEN.10/08/2024
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WorkFile ASSIGN TO 'work.tmp'.
           SELECT OrgFile ASSIGN TO '18student.dat'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SortedFile ASSIGN TO '18student2.dat'
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD OrgFile.
       01 StudData.
           02 IDNum PIC 9.
           02 StudName PIC X(10).
       SD WorkFile.
       01 WStudData.
           02 WIDNum PIC 9.
           02 WStudName PIC X(10).
       FD SortedFile.
       01 SStudData.
           02 SIDNum PIC 9.
           02 SStudName PIC X(10).
       WORKING-STORAGE SECTION.
       
       PROCEDURE DIVISION.
       SORT WorkFile ON ASCENDING KEY SIDNUM
           USING OrgFile
           GIVING SortedFile.

           STOP RUN.
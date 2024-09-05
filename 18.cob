       IDENTIFICATION DIVISION.
       PROGRAM-ID.       merge-records.
       AUTHOR.       Giulio.
       DATE-WRITTEN.11/08/2024
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           *> Merge Exercise
           SELECT WorkFile ASSIGN TO 'work.tmp'.
           SELECT File1 ASSIGN TO '18student.dat'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT File2 ASSIGN TO '18student_sorted.dat'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT NewFile ASSIGN TO '18student_merged.dat'
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD File1. *> Per il MERGE i file devono essere FD (File Description).
       01 StudData.
           02 IDNum PIC 9.
           02 StudName PIC X(10).
       SD WorkFile. *> SD (Sort Description)
       01 WStudData.
           02 WIDNum PIC 9.
           02 WStudName PIC X(10).
       FD File2.
       01 SStudData.
           02 SSIDNum PIC 9.
           02 SSStudName PIC X(10).
       FD NewFile.
       01 NStudData.
           02 NIDNum PIC 9.
           02 NStudName PIC X(10).
       WORKING-STORAGE SECTION.
       
       PROCEDURE DIVISION.
           SORT WorkFile ON ASCENDING KEY SSIDNUM
               USING File1
               GIVING File2.
           MERGE WorkFile ON ASCENDING KEY NIDNum USING File1, File2
           GIVING NewFile.


           STOP RUN.
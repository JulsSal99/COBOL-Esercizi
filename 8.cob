       IDENTIFICATION DIVISION.
       PROGRAM-ID.       PARAGRAFI.
       AUTHOR.       Giulio.
       DATE-WRITTEN.20/07/2024
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       SubUno.
           DISPLAY "Nel Paragrafo 1"
           PERFORM SubDue
           DISPLAY "Ritorna al Paragrafo 1"
           PERFORM SubQuattro 2 TIMES
           *> PERFORM 2 TIMES
           *>    DISPLAY "Repeat"
           *>END-PERFORM
           STOP RUN.
       SubTre.
           DISPLAY "Nel paragrafo 3".
       SubDue.
           DISPLAY "Nel paragrafo 2"
           PERFORM Subtre
           DISPLAY "Ritornato al Paragrafo 2".
       SubQuattro.
           DISPLAY "Ripeti 2".
       STOP RUN.
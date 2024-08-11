       IDENTIFICATION DIVISION.
       PROGRAM-ID.       RUBRICA.
       AUTHOR.       Giulio.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DettagliStudente.
           02 Corso       PIC 9(5).
           02 Matr       PIC 9(5).
           02 NomeStud.
                  03 Nome       PIC X(20).
                  03 Cognome       PIC X(20).
           02 DataN.
                  03 Giorno       PIC 99.
                  03 barra1        PIC X.
                  03 Mese       PIC 99.
                  03 barra2        PIC X.
                  03 Anno       PIC 9(4).
       01 CurrentDate.
           02 CurrentYear       PIC 9(4).
           02 CurrentMonth       PIC 99.
           02 CurrentDay       PIC 99.
       01 CurrentTime.
           02 CurrentHour       PIC 99.
           02 CurrentMinute       PIC 99.

       PROCEDURE DIVISION.

           DISPLAY "RUBRICA: ".
           DISPLAY "Inserisci nome: ".
                  ACCEPT Nome.
           DISPLAY "Inserisci cognome: ".
                  ACCEPT Cognome.
           DISPLAY "Inserisci data di nascita (gg/mm/aaaa): ".
                  ACCEPT DataN.
           IF barra1 NOT = "/" OR barra2 NOT = "/"
                  DISPLAY "Formato data non corretto."
                  STOP RUN.
           DISPLAY "Inserisci corso: ".
                  ACCEPT Corso.
           DISPLAY "Inserisci matricola: ".
                  ACCEPT Matr.
           ACCEPT CURRENTDATE FROM DATE YYYYMMDD.
           ACCEPT CURRENTTIME FROM TIME.
       
           DISPLAY "Dati inseriti il " CURRENTDAY "/" CURRENTMONTH "/" 
           CURRENTYEAR.
           DISPLAY "Alle " CURRENTHOUR ":" CURRENTMINUTE.
           DISPLAY "Alle " CurrentHour ":" CurrentMinute.
           DISPLAY "Nome: " Nome " " Cognome.
           DISPLAY "Nato il: " Giorno "/" Mese "/" Anno.
           DISPLAY "Matricola: " Corso "-" Matr.
           
       STOP RUN.
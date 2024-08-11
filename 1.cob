       IDENTIFICATION DIVISION.
       PROGRAM-ID.       PrimoProgramma.
       AUTHOR.       Giulio.
       DATE-WRITTEN.22/07/2024
       ENVIRONMENT DIVISION.
       *> dove si specificano i dettagli dell'ambiente in cui il
       *> programma viene eseguito. Include sezioni come 
       *> CONFIGURATION SECTION e INPUT-OUTPUT SECTION.
       CONFIGURATION SECTION.
       *> dichiarare configurazioni specifiche del sistema, come le 
       *> impostazioni per l'host e le periferiche
       SPECIAL-NAMES.
       *> viene utilizzata per dare nomi simbolici a specifici valori o 
       *> per estendere il set di caratteri. eg. DECIMAL-POINT IS COMMA
       DATA DIVISION.
       *> dove si definiscono tutte le variabili e le strutture dati
       FILE SECTION.
       *> dove si definiscono i file che il programma andra' a leggere
       *> o scrivere
       WORKING-STORAGE SECTION.
       *> dove si dichiarano le variabili di lavoro, che sono variabili
       *> temporanee utilizzate durante l'elaborazione del programma.
       *>  01-49: per descrivere variabili e strutture di dati.
       *>  66: per definire "renames" (alias) per altre variabili.
       *>  77: per definire variabili indipendenti, non strutturate.
       *>  88: per definire condizioni o valori booleani.
       *> i nomi devono essere univoci, MA possono essere uguali in
       *> gruppi differenti
       01 Num1       PIC 9(3).
       01 Num2       PIC 9(3).
       01 Risultato  PIC 9(4).
       PROCEDURE DIVISION.
       *> il codice eseguibile del programma
              DISPLAY "Il primo programma".
              DISPLAY "Inserisci il primo numero: ".
              ACCEPT Num1.
              DISPLAY "Inserisci il secondo numero: ".
              ACCEPT Num2.
              ADD Num1, Num2 GIVING Risultato.
              DISPLAY "Inserisci risultato è: ", Risultato.
       STOP RUN.
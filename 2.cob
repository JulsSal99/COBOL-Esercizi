       IDENTIFICATION DIVISION.
       PROGRAM-ID.       CALCOLATRICE.
       AUTHOR.       Giulio.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> PIC permette di formatare
       01 Num1       PIC 9(3). *> 9: posizione numerica sempre mostrata
       01 Num2       PIC Z99. *> Z: posizione numerica che, se è zero,
                               *> sarà uno spazio vuoto.
       01 Operatore  PIC X.
       01 Risultato  PIC 9(6).
       01 Resto    PIC 9(3).
       PROCEDURE DIVISION.

           DISPLAY "CALCOLATRICE: ".
           DISPLAY "Inserisci il primo numero: ".
           ACCEPT Num1
           DISPLAY "Inserisci il secondo numero: ".
           ACCEPT Num2.
           DISPLAY "Inserisci operatore: ".
           ACCEPT Operatore.

           if Operatore="+" THEN
           ADD Num1, Num2 GIVING Risultato.
           if Operatore="-" THEN
           SUBTRACT Num1 FROM Num2 GIVING Risultato.
           if Operatore="*" THEN
           MULTIPLY Num1 BY Num2 GIVING Risultato.
           if Operatore="/" THEN
           DIVIDE Num1 BY Num2 GIVING Risultato REMAINDER Resto.
           if Operatore="/" THEN
           COMPUTE Risultato = Num1 ** Num2.
           DISPLAY "Il risultato e': ", Risultato " con Resto: " Resto.
       STOP RUN.

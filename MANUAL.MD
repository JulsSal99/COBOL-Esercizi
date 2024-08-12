# IDENTIFICATION DIVISION.
# PROGRAM-ID.       PrimoProgramma.
# AUTHOR.       Giulio.
# DATE-WRITTEN.22/07/2024

# ENVIRONMENT DIVISION.
Dove si specificano i dettagli dell'ambiente in cui il programma viene eseguito. Include sezioni come CONFIGURATION SECTION e INPUT-OUTPUT SECTION.

# INPUT-OUTPUT SECTION.
divisa in FILE-CONTROL e I-O CONTROL (facoltativo)

# FILE-CONTROL.
si dichiarano i file utilizzati nel programma e si specificano le modalità di accesso.

# CONFIGURATION SECTION.
dichiara configurazioni specifiche del sistema, come le impostazioni per l'host e le periferiche

# SPECIAL-NAMES.
Viene utilizzata per dare nomi simbolici a specifici valori o per estendere il set di caratteri. eg. DECIMAL-POINT IS COMMA

# DATA DIVISION.
dove si definiscono tutte le variabili e le strutture dati

# FILE SECTION.
Dove si definiscono i file che il programma andra' a leggere o scrivere

# WORKING-STORAGE SECTION.
Dove si dichiarano le variabili di lavoro, che sono variabili temporanee utilizzate durante l'elaborazione del programma.
I nomi devono essere univoci, MA possono essere uguali in gruppi differenti. 
Esempio: 01 Num       PIC 9(2) VALUE 1.
Legenda del primo numero:
- 01-49: per descrivere variabili e strutture di dati.
- 66: per definire "renames" (alias) per altre variabili.
- 77: per definire variabili indipendenti, non strutturate.
- 88: per definire condizioni o valori booleani.
Il numero viene formattato con PIC. Legenda dei simboli in PIC:
- 9: Numerico
- X: AlfaNumerico
- Z: diventa uno spazio se 0
- V: virgola
- S: signed

Nota1: Scrivere "9(2)" è uguale a scrivere "99".
Nota2. "Value" da un valore di default.

Esempio: 01 PIValue CONSTANT AS 3.14.
Crea una costante.

# PROCEDURE DIVISION.
Indica il codice eseguibile del programma
- STOP RUN.                                             - Termina il Main
- DISPLAY "" Num1.                                      - Mostra " "Num1
  - DISPLAY "Valore iniziale: " Num NO ADVANCING.       - NO ADVANCING non manda a capo
- ACCEPT Num1.                                          - prende Num1 in input
- COMPUTE Risultato = Num1 ** Num2.                     - è utilizzato per eseguire operazioni aritmetiche e assegnare il risultato direttamente a una o più variabili
  - COMPUTE Num ROUNDED = 3.0 + 2.005.                  - ROUNDED arrotonda
- if Operatore="/" THEN                                 - esegue un ciclo if THEN
- ADD Num1, Num2 GIVING Risultato.                      - esegue la somma
- SUBTRACT Num1 FROM Num2 GIVING Risultato.
- MULTIPLY Num1 BY Num2 GIVING Risultato.
- DIVIDE Num1 BY Num2 GIVING Risultato REMAINDER Resto.
- ACCEPT CURRENTDATE FROM DATE YYYYMMDD.                - permette di ottenere la data attuale
  - Il formato è il seguente:
         01 CurrentDate.
           02 CurrentYear       PIC 9(4).
           02 CurrentMonth       PIC 99.
           02 CurrentDay       PIC 99.
- ACCEPT CURRENTTIME FROM TIME.                         - permette di ottenere l'ora attuale
  - Il formato è il seguente:
       01 CurrentTime.
           02 CurrentHour       PIC 99.
           02 CurrentMinute       PIC 99.
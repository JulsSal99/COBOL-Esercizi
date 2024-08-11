       IDENTIFICATION DIVISION.
       PROGRAM-ID.       STRINGS.
       AUTHOR.       Giulio.
       DATE-WRITTEN.22/07/2024
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 SampStr       PIC X(18) VALUE 'eerie beef sneezed'.
       01 TMPNum       PIC 99 VALUE 0.
       01 Nome       PIC X(6) VALUE 'Martin'.
       01 Cognome       PIC X(4) VALUE 'King'.
       01 Persona       PIC X(11).
       01 MNome       PIC X(11) VALUE 'Luther King'.
       01 FMLName       PIC X(18).
       01 SStr1       PIC X(7) VALUE "The egg".
       01 SStr2       PIC X(9) VALUE "is #1 and".
       01 Dest       PIC X(33) VALUE "is the big chicken".
       01 Ptr       PIC 9 VALUE 1.
       01 SStr3       PIC X(3).
       01 SStr4       PIC X(3).
       PROCEDURE DIVISION.
           INSPECT SampStr TALLYING TMPNum FOR CHARACTERS.
           DISPLAY "Numero di caratteri : " TMPNum.
           INSPECT SampStr TALLYING TMPNum FOR ALL 'e'.
           DISPLAY "Numero di E : " TMPNum.
           DISPLAY FUNCTION UPPER-CASE(SampStr).
           DISPLAY FUNCTION LOWER-CASE(SampStr).

           STRING Nome DELIMITED BY SIZE SPACE Cognome DELIMITED BY SIZE
           INTO Persona. *> DELIMITED BY SPACE: la stringa sarà
                         *> considerata fino al primo spazio trovato
                         *> DELIMITED BY SIZE: nell'interezza
           DISPLAY "Persona : " Persona.
           
           STRING Nome DELIMITED BY SPACES   SPACE
           MNome DELIMITED BY SIZE SPACE
           Persona DELIMITED BY SIZE INTO FMLName
           ON OVERFLOW DISPLAY 'Overflowed'.
           DISPLAY "Nome Completo: " FMLName.
           
           DISPLAY " ".
           DISPLAY "SSTR1: " Sstr1.
           DISPLAY "SSTR2: " Sstr2.
           DISPLAY "DEST: " DEST.
           STRING SSTR1 DELIMITED BY SIZE SPACE
           SSTR2 DELIMITED BY "#" INTO DEST WITH POINTER Ptr
           ON OVERFLOW DISPLAY 'Overflowed'. 
           *> PTR è un puntatore di posizione numerico.
           DISPLAY "DEST: " DEST.
           
           DISPLAY " ".
           UNSTRING SSTR1 DELIMITED BY SPACE INTO SSTR3, SSTR4.
           DISPLAY "SSTR1: " SSTR1.
           DISPLAY "SSTR3: " SSTR3.
           DISPLAY "SSTR4: " SSTR4.

       STOP RUN.
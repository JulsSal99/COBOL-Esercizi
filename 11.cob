       IDENTIFICATION DIVISION.
       PROGRAM-ID.       CASTING.
       AUTHOR.       Giulio.
       DATE-WRITTEN.22/07/2024
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 StartNum PIC 9(8)V99 VALUE 0000123.55.
       01 NoZero PIC ZZZZZZZ9.99.
       01 NoZPlusC PIC ZZ,ZZZ,ZZ9.99.
       01 Dollar PIC $$,$$$,$$9.99. *> posizione riservata per il simbolo
       *>  del dollaro. Se non ci sono abbastanza cifre significative da
       *>  visualizzare, questi saranno mostrati come spazi vuoti.
       01 BDay PIC 9(8) VALUE 12211974.
       01 ADate PIC 99/99/9999.
       
       01 Price PIC 9(4)V99.
       01 TaxRate PIC V999 VALUE .075.
       01 FullPrice PIC 9(4)V99.
       PROCEDURE DIVISION.
           MOVE StartNum TO NOZERO.
           DISPLAY NOZERO.
           MOVE StartNum TO NoZPlusC.
           DISPLAY NoZPlusC.
           MOVE StartNum TO Dollar.
           DISPLAY Dollar.
           MOVE BDay TO ADate.
           DISPLAY ADate.

           DISPLAY "Enter the price: " WITH NO ADVANCING.
           ACCEPT Price.
           COMPUTE FULLPRICE ROUNDED = Price + (Price + TaxRate).
           DISPLAY "Price + Tax : " Fullprice.
       STOP RUN.
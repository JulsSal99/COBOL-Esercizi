       IDENTIFICATION DIVISION.
       PROGRAM-ID.       tables.
       AUTHOR.       Giulio.
       DATE-WRITTEN.08/08/2024
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Table1.
           02 Friend PIC X(15) OCCURS 4 TIMES.

       01 CustTable.
           02 CustName OCCURS 5 TIMES.
               03 FName PIC X(15).
               03 LName PIC X(15).

       01 OrderTable.
           02 Product OCCURS 3 TIMES INDEXED BY I.
               03 ProdName PIC X(10).
               03 WS-SPACE PIC X(1) VALUE ' '.
               03 ProdSize OCCURS 3 TIMES INDEXED BY J.
                   04 SizeType PIC A.

       PROCEDURE DIVISION.
           DISPLAY "-----PT1----"
           MOVE 'JOY' TO FRIEND(1).
           MOVE 'Willow' TO FRIEND(2).
           MOVE 'Ivy' TO FRIEND(3).
           DISPLAY Friend(1).
           DISPLAY Table1.
           DISPLAY "------------"

           DISPLAY "-----PT2----"
           MOVE 'Juls' TO FName(1).
           MOVE 'Sal' TO LName(1).
           MOVE 'Lisa' TO FName(2).
           MOVE 'Sue' TO LName(2).
           DISPLAY CustName(1).
           DISPLAY CustTable.
           DISPLAY "------------"

           DISPLAY "-----PT3----"
           SET I J TO 1. *> Inizializza le variabili I e J a 1
           MOVE 'Blue Shirt' TO Product(I). *> Product(1)
           MOVE 'S' TO ProdSize(I,J). *> ProdSize(riga,colonna) (1,1)
           SET J UP BY 1.
           MOVE 'M' TO ProdSize(I,J). *> (1,2)
           SET J DOWN BY 1.
           DISPLAY "1: " OrderTable.
           MOVE 'Blue Shirt SMLRed Shirt S  Blank Shirt S' TO 
           ORDERTABLE.
           DISPLAY "2: " OrderTable.
           MOVE 'Grey Shirt S' TO Product(3).
           DISPLAY "Product 3: " Product(3).
           SET I UP BY 1.
           DISPLAY "Product " I ": " Product(I).
           MOVE 'Grey Shirt S' TO Product(I).
           DISPLAY "3: " OrderTable.
           PERFORM GetProduct VARYING I FROM 1 BY 1 UNTIL I>2.
           GO TO LookUp.
           GetProduct.
               DISPLAY "GetProduct: I:", I, " - " PRODUCT(I).
               PERFORM GetSizes VARYING J FROM 1 BY 1 UNTIL J>3.
           GetSizes.
               DISPLAY "GetSizes: J:", J, " - " ProdSize(I,J).
           LookUp.
               SET I TO 4.  *> indica il punto di partenza
               SEARCH PRODUCT *> FORMALITA' per iniziare una ricerca
                   AT END DISPLAY 'Product Not Found'
                   WHEN ProdName(I) = 'Blue Shirt'
                       DISPLAY 'Blue Shirt Found' *> ProdSize è solo un indice.
                       PERFORM GetSizes
               END-SEARCH.
           DISPLAY "------------"

           STOP RUN.
           
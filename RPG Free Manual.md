# RPGLE
RPGLE (RPG IV), al contrario del COBOL, ha una larghezza massima di 80 caratteri, ma, con lo standard libero, questo limite non esiste più.

Fasi prelminari: 
 - ```CRTLIB```
 - ```CRTSRPF```
 - Per creare un file RPGLE sorgente: ```WRKMBRPDM``` o ```ADDPFM``` + F4 + ```RPGLE```
Nel SEU le prime 5 colonne non vengono mostrate.

```RPGLE
**free
dsply 'Hello World';
return;
```
Per compilare: 
 - ```CRTBNDRPG``` + F4
 - dal SEU: F3 e poi F14

Per vedere il risultato: ```WRKOBJPDM yourlibrary```
Per chiamare il programma: ```call program/yourusr```
Per cancellare la vecchia versione del programma: ```DLTPGM```

Per forzare la terminazione di un programma ci sono due metodi:
 - ```return;```
 - ```*inlr = '1';```: setta l'ultimo record a 1.
## i tipi di variabili
In RPGLE (RPG IV), ci sono diversi tipi di dati che puoi utilizzare. Ecco i principali:
 - ```int```: intero con segno.
 - ```uns```: intero senza segno.
 - ```dec(p,s)```: numero decimale con precisione p (numero totale di cifre) e scala s (cifre a destra della virgola).
 - ```float```: numero in virgola mobile.
 - ```char(n)```: stringa di caratteri di lunghezza n.
 - ```varchar(n)```: stringa di caratteri di lunghezza variabile fino a n.
 - ```bin(n)```: numero binario.
 - ```pointer```: utilizzato per riferimenti a indirizzi di memoria.

Date e tempo:
 - ```date```: data.
 - ```time```: ora.
 - ```timestamp```: data e ora.

Other Types:
 - ```graphic(n)```: caratteri grafici.
 - ```vargraphic(n)```: caratteri grafici a lunghezza variabile.
 - ```DSS```: tipo per la gestione delle strutture dati.

## Le variabili
Dichiarare le variabili:
```RPGLE
       dcl-s name char(10) inz('Jim');
       dsply name;
       return;
```

Per dichiarare una variabile **costante**:
```RPGLE
   dcl-c MAX-ELEMS 100;
   dcl-c default_city_name 'London';
   dsply max_elems;
   dsply default_city_name;
   return;
```

Per dichiarare una variabile **standalone**:
```RPGLE
dcl-s num int(10);
for num = 1 to 3;
   dsply ('i = ' + %char(num));
endfor;
return;
```
```%char``` converte il numerico in una forma stampabile.

```RPGLE
dcl-s chr char(10);
chr = 'hello'
dsply chr;
return;
```
```hello```, con lunghezza 5, sarà stampato con 5 spazi alla fine perché asegnato a una variabile da 10 caratteri. 

Per dichiarare e valorizzare una **struttura dati** (Data Struct):
```RPGLE
dcl-ds info qualified;
    name char(10) inz('Sam');
    salary packed(9 : 2) inz(50000.25);
end-ds;

dcl-ds otherInfo likeds(info) inz(*likeds);

dsply (info.name + ' has a salary of' + %char(info.salary));
otherInfo.name = 'Joe';
otherInfo.salary += 10000;
dsply (otherInfo.name + ' has a salary of' + %char(otherInfo.salary));

return;
```
 - ```qualified``` indica che i campi all'interno di questa struttura possono essere referenziati usando il nome della struttura (ad esempio, ```info.name```).
 - ```packed(9 : 2)```: I numeri sono memorizzati in un formato che occupa meno spazio rispetto a un numero in virgola mobile o a un numero intero standard; Significa che puoi memorizzare numeri fino a 999999.99 (9 cifre totali, con 2 decimali), e il numero verrà memorizzato in 5 byte.
 - ```dcl-ds otherInfo likeds(info) inz(*likeds);```: viene dichiarata un'altra struttura, che è "like" (simile) alla struttura info. L'opzione inz(*likeds) inizializza i campi con i valori predefiniti della struttura info, ma non copia i valori dei campi.

## Le date
```RPGLE
       dcl-s dates date(*iso) dim(3); 
       dates(1) = %date(); // la data corrente 
       dates(2) = %date() + %days(1); // domani 
       dates(3) = %date() + %years(1); // l'anno prossimo 
       dsply (%char(dates(1)) + ' ' 
            + %char(dates(2)) + ' ' 
            + %char(dates(3))); 
       return;
```

Le date hanno formato ISO (aaaa-mm-gg).
```%date``` restituisce la data corrente quando non viene specificato alcun parametro. ```%date``` può anche convertire un parametro numerico o di tipo carattere in una "data vera".

## Gli array
RPG supporta solo una dimensione per gli array. Gli array multidimensionali possono essere simulati utilizzando array di strutture dati con sottocampi di array; invece di codificare cell(ijk) dovresti codificare table(i).row(j).col(k).

```RPGLE
       dcl-ds families qualified dim(5);
           address varchar(50);
           numPeople uns(3); 
           dcl-ds people dim(8); 
              name varchar(25); 
              age packed(5); 
           end-ds; 
       end-ds;

       families(1).address = '10 Mockingbird Lane';
       families(1).people(1).name = 'Alice'; 
       families(1).people(1).age = 3;
       families(1).people(2).name = 'Bill'; 
       families(1).people(2).age = 15;

       families(1).numPeople = 2;
       dcl-s numFamilies uns(5) inz(1);
       dcl-s i int(10);
       dcl-s j int(10); 
       for i = 1 to numFamilies;
          dsply (families(i).address); 
          for j = 1 to families(i).numPeople; 
             dsply (families(i).people(j).name  + ' is '
                 + %char(families(i).people(j).age)
                 + ' years old.'); 
          endfor; 
       endfor;  
      return;
```

## I comandi e le procedure
 - dcl-proc: Inizia la definizione di una procedura.
 - dcl-pi: Definisce l'interfaccia di una procedura.
 - dcl-pr: Dichiara una procedura esterna.

```qcmdexc``` è il programma di sistema per eseguire comandi. ```extpgm(prg)``` indica che è un programma esterno.
```DBCS``` (Double Byte Character Set) non viene utilizzato, quindi è definito con l'opzione *nopass, che indica che non viene passato alcun valore.
La chiamata al programma viene fatta così:
```RPGLE
      dcl-pr qcmdexc extpgm;
         theCmd char(3000) const;
         cmdLen packed(15 : 5) const;
         dbcs char(3) const options(*nopass);
      end-pr;
```
E' possibile anche specificare il nome del programma effettivo da eseguire:
```RPGLE
       // dichiarazione di un'interfaccia per una routine di programma in RPG (Report Program Generator)
      dcl-pr qcmdexc extpgm('QCMDEXC'); 
          theCmd char(3000) const; 
          cmdLen packed(15 : 5) const;  
          dbcs char(3) const options(*nopass); 
      end-pr;  
      dcl-s cmd varchar(100); 

      cmd = 'DSPJOB OUTPUT(*PRINT)';  
      qcmdexc (cmd : %len(cmd));  // %len(cmd) specifica la lunghezza del messaggio
      qcmdexc ('WRKSPLF' : 7); // crea una stampa
      return;
```
```RPGLE
      /if defined(*CRTBNDRPG)
         ctl-opt dftactgrp(*no) actgrp(*new);
      /endif

      ctl-opt option(*srcstmt);  // visualizzare le istruzioni sorgente durante il debug
      dcl-s num int(10) inz(25);   
      print ('This message is much longer than the 52 ' + 'characters that DSPLY allows. ' + 'The value of variable "num" is ' + %char(num));
      return;

      dcl-proc print;
        // dichiara una PROGRAM INTERFACE che non restituisce valori (*n) e prende un messaggio (msg) come input.
        dcl-pi  *n; 
          msg varchar(5000) const;
        end-pi;

        dcl-pr printf extproc(*dclcase);  // procedura esterna
          template pointer value options(*string);  // puntatore a una stringa.
          dummy int(10) value options(*nopass);   // non viene passato
        end-pr;

        dcl-c NEWLINE x'15'; 
        printf(msg + NEWLINE);
      end-proc print;
```

```ctl-opt dftactgrp(*no) actgrp(*new);``` : le opzioni di controllo specificano che il programma non deve utilizzare il gruppo di attivazione predefinito (dftactgrp(*no)) e che deve utilizzare un nuovo gruppo di attivazione (actgrp(*new)).

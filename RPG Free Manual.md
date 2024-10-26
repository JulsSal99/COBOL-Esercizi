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

Per dichiarare e valorizzare una **struttura dati**:
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



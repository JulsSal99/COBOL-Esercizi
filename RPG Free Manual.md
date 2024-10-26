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

```RPGLE
       dcl-s name
char(10) inz('Jim');
       dsply name;
       return;
```

Per forzare la terminazione di un programma ci sono due metodi:
 - ```return;```
 - ```*inlr = '1';```: setta l'ultimo record a 1.


# Nozioni di AS400 (IBMi)
L'AS400 è un mainframe (che funziona da server web, etc.) collegato a vari terminali emulati.
I caratteri sull'AS400 sono lunghi massimo 10 caratteri.
I campi di input-output sono sottolineati e si possono navigare usando la tabulatura. Un campo sottolineato bianco è obbligatorio, mentre gli altri solitamente hanno valori di default.

Nella prima schermata c'è ```Sistema```, ```Sottosistema``` (entrambi indicati con Q sia di AS/400 sia dichiarati dall'utente. I sistemi e sottosistemi sono a lotti "batch").

I comandi sono oggetti di 10 caratteri: _verbo + (attributo) + predicato_ tendenzialmente senza vocali:
 - SHIFT + Fn - formula i numeri superiori al 12 fino al 24.

L'asterisco in AS/400 indica un valore simbolico e può servire per ricerca di oggetti o parametri di comando: 
   - ad esempio, se cerchi un file usando MYFILE*, il sistema restituirà tutti i file che iniziano con MYFILE, come MYFILE1, MYFILEA, ecc.
   - ```*ALL```: Utilizzato per indicare che si desidera considerare tutti gli oggetti o tutti i valori possibili in un determinato contesto (eg. ```WRKOBJ OBJ(MYLIB/*ALL)```).

Molti comandi utilizzano acronimi che seguono una struttura ben definita per eseguire varie operazioni sul sistema
 - ```DSP``` (Display. eg. ```DSPJOB```, visualizza solo, non modifica)
 - ```WRK``` (Work with. eg. ```WRKLIB```, ```WRKOBJ```) - visualizzare e interagire con gli oggetti
 - ```CHG``` (Change. eg. ```CHGJOB```, ```CHGPWD``` cambiare password)
 - ```DLT``` (Delete)
 - ```CRT``` (Create. eg ```CRTJOBQ```, ```CRTLIB```)
 - ```END``` (End: termina)
 - ```SND``` (Send)
 - ```STR``` (Start)
 - ```RST``` (Restore)
 - ```SAV``` (Save)
l'asterisco viene usato per specificare un valore speciale o una scelta predefinita: ```*ALL```, ```*NONE```, ```*CURRENT``` (contesto corrente o l'utente corrente), ```*SYSVAL```. 

## I tasti funzione
 - **F1 - Help**: Mostra la guida in linea per la schermata corrente o il comando che stai utilizzando. Se il cursore si trova su una sezione dello schermo, mostra una una descrizione della porzione di testo. 
 - **F2 - Change**: Permette di modificare le informazioni nella schermata corrente.
 - **F3 - Exit**: Esce dalla schermata corrente o annulla l'operazione in corso.
 - **F4 - Prompt**: Mostra i parametri di input per il comando corrente, consentendo di inserire i valori richiesti.
 - **F5 - Refresh**: Ricarica la schermata corrente, utile per aggiornare le informazioni visualizzate.
 - **F6 - Create**: Permette di creare nuovi oggetti, come file, librerie, ecc.
 - **F7 - Scroll Up**: Scorre verso l'alto nella schermata corrente.
 - **F8 - Scroll Down**: Scorre verso il basso nella schermata corrente.
 - **F9**: ripete l'ultimo comando.
 - **F10 - Display/Hide Menu**: Mostra o nasconde il menu principale nella schermata corrente.
 - **F12 - Cancel**: Annulla l'operazione corrente o torna alla schermata precedente.

 - 3: copia

## GO
Il comando ```GO``` è utilizzato per accedere a un menu o una sottosistema di comandi di opzioni e comandi specifici che puoi eseguire.
 - ```GO``` - selezione menù
 - ```GO MENU``` - menù personale
 - ```GO PROGRAM``` - menù per la gestione dei programmi
 - ```GO MAIN``` - menu principale standard del sistema

## Gli oggetti: WRKOBJ
Un oggetto su AS/400 è qualsiasi elemento del sistema che può essere creato, gestito o utilizzato.
Gli OBJ sono per esempio file, programmi, librerie e altre risorse, memorizzati permanentemente su disco:
 - Libreria (```*LIB```. Nota: le librerie non possono contenere altre librerie)
 - File (```*FILE```)
 - Programma (```*PGM```)
 - Area dati (```*DTAARA```)
 - Coda di output (```*OUTQ```)

Ogni oggetto è identificato da 3 oggetti di max 10 caratteri:
 - nome
 - topo
 - posizione

```WRKOBJ``` + F4 - menu per inserire parametri del comando senza bisogno di conoscerli a memoria (nome, libreria e tipo). 

```BASH
WRKOBJ OBJ(libreria/oggetto) OBJTYPE(*tipo)
```
 - ```OBJ``` - nome dell'oggetto che vuoi cercare. * per cercare con un certo pattern.
 - ```OBJTYPE``` - il tipo di oggetto (ad esempio, ```*PGM``` per programmi, ```*FILE``` per file, ```*LIB``` per librerie, etc.).

WRKOBJ GIULIOS mosta gli obj del profilo.
*QUSRSYS tipo libreria
LIBL sta per library list

## I Jobs
I **job** (o task) su IBMi (AS/400) sono processi (unità minima di elaborazione) o attività che il sistema esegue.
Ci sono diversi tipi:
 - **Job interattivi** (iniziano con ```INTER```. Richiedono l'interazione dell'utente. Per esempio il login di un utente)
 - **Job batch** (per operazioni programmate o lunghe. Lanciati dalla Job Queue. Se eseguo un programma video nel sottosistema batch, darà errore)
   - ```Qbatch``` (```batch```=lotto. Ripete in loop un certo numero di operazioni costanti in cui non è necessario un operatore). 
 - **Job di sistema** (iniziano con ```Q```)
   - ```QINTER``` è un sottosistema che gestisce job interattivi con altri utenti, quindi 'compila' la richiesta
 - **Job di comunicazione** (trasferimento dati (come FTP o SNA))
 - **Job di spool** (stampanti o altri dispositivi di output)

```WRKACTJOB``` mostra i sottosistemi
 - Stato ```MSGW``` vuol dire che è in attesa di messaggio

Componenti di un Job:
 - Job Name
 - Job Number (Numero univoco assegnato automaticamente dal sistema. Progressivo che poi riparte dall'inizio)
 - User (utente che ha avviato il job o sotto il quale è eseguito)
 - Job Queue (in che ordine e quando sarà eseguito (soprattutto per i job batch)).
 - Job Description (percorsi del file, le librerie da usare e altre risorse).

```signoff``` - serve per deloggarsi da terminale e termina i lavori

Diversi stati del job:
 - ```ACTIVE```
 - ```WAITING```
 - ```HELD``` (pausa)
 - ```COMPLETED```
 - ```ENDED``` (terminato manualmente o automaticamente)

```DSPJOB```: È principalmente per visualizzare informazioni dettagliate su un job. È un comando di sola lettura che fornisce una panoramica dettagliata del job.
```WRKJOB``` (visualizzazione del lavoro), al contrario di DSPJOB (per visualizzare informazioni dettagliate su un job), è utilizzato per gestire i job: visualizzare un elenco di job, eseguire operazioni, e gestirli.

## lista delle librerie
Una libreria è un oggetto che contiene altri oggetti, ma non altre librerie.

La lista delle librerie il path che il sistema utilizza per ricercare gli oggetti.
Il comando ```DSPLIB``` mostra le librerie.
La lista delle librerie è locale ad ogni utente ed è organizzata su 3 livelli:
 - lista delle librerie di sistema (```QSYS```, ```QCMD```, etc.)
 - lista corrente (```CUR```, corrente, è la prima delle librerie. Potrebbe tranquillamente non esistere. Viene usato per buttare altre librerie di scarto)
 - lista delle librerie utente

```EDTLIBL``` - per modificare l'elenco delle librerie. I numeri sono di 10 in 10 per spostarle nell'elenco.
Per togliere una libreria dall'elenco basta cancellarne il testo.
Sullo 0 si aggiungono librerie.
 - ```QTEMP```: temporanea
 - ```QGPL```: (general purpose library) usato per copiare alcune informazioni che potrebbero venir eliminate

Il formato dei caratteri usato è la BCD (Binary-Coded Decimal): ogni cifra decimale viene convertita singolarmente nel suo equivalente binario a 4 bit.

```ADDLIBLE (libl entry)``` - per aggiungere una libreria all'elenco delle librerie
```BASH
ADDLIBLE LIB(TESTLIB) POS(*AFTER)
```
```RMVLIBLE``` - rimuove la libreria

CTRL+INVIO = uscita campo

```DSPJPBLOG``` + F10 + shift F6: vedere il log.

## librerie
Le liste delle librerie non si aggiornano automaticamente
```CRTLIB (Create Library)``` crea una nuova libreria.
```DLTLIB``` rimuove una libreria

## Gli oggetti
Fra i file fisici di tipo SRC (PF-SRC) compariranno sempre questi 4 file:
 - ```QPFSRC```, contiene i sorgenti dei file fisici, ovvero la struttura dei file.
 - ```QLBLSRC```, contiene i sorgenti che serviranno per creare i programmi Cobol.
 - ```QCLSRC```, contiene i sorgenti che serviranno per creare programmi di tipo CLP. 
 - ```QDDSSRC```, contiene i sorgenti che serviranno per creare le maschere video (DSPF) e i PRTF (file di stampa). 

gli oggetti:
 - ```PGM``` sono COBOL CMP
 - ```*FILE```
   - ```DF``` - DISPLAY FILE (Maschere video)
     - in ```QDDSSRC```
   - ```PF``` - PRINTER FILE 
     - in ```QPFSRC```
   - ```PF``` - PHYSICAL FILE
   - ```LF``` - LOGICAL FILE

## PDM
I membri della libreria:
 - Programma di sviluppo ```GO PROGRAM``` + 2  o  ```strpdm``` (start+pdm)
 - ```CRTSRCPF FILE(utente/file)``` Creazione file sorgenti.
 - creiamo il file ```QPFSRC``` e ```QCLSRC``` (control language)
 - F5 -> aggiorna

Il **PDM (Program Development Manager)** è uno strumento utilizzato principalmente per gestire e modificare file sorgente, oggetti di librerie e processi di compilazione.

Il **SEU (Source Entry Utility)** è un componente del PDM, e costituisce un editor di testo per il codice sorgente.

Se digito a sinistra il numero, vado alla riga interessata

 - ```I``` + INVIO + testo -> nuova riga (posso mettere un numero per dire quante righe)
 - ```C``` copy
   - ```CC``` copia un gruppo
   - ```a``` (after) per incollare dopo (non deve essere ad inizio)
   - ```b``` (before) per incollare prima
 - ```D``` delete
 - ```M``` move
   - ```a``` (after) per incollare dopo
   - ```b``` (before) per incollare prima

su SEU (F10) se metto:
 - ```SAVE``` salva
 - ```F```+nome o nome+F16 cerca
   - si può usare anche SHIFT+F4
 - ```C```+nomeprec+nomenuovo change 
   - ```C```+nomeprec+nomenuovo ```ALL``` cambia tutti 
     - ```C``` nprec nnuovo ```a``` 
 - ```rp``` repeat: ripete la riga

Shortcuts:
 - ```F5``` ricarica
 - SHIFT+F8 date di modifica.
 - SHIFT+F2 apri secondo file

```COBOL
XX
  XX   
```
Nasconde il testo e ```SF99``` e ```SL99``` fanno vedere il testo. ```F5``` fa rivedere tutto.

## DDS
I **DDS (Data Description Specifications)** sono un tipo di codice viene utilizzato per definire file fisici, file logici e altri oggetti di database sull'AS/400.

```COBOL
----.----1----.----2----.----3----A----4----.----
        *-----------------------------------------------*
        *---Procedura - Modulo base                  ---*
        *---Area      - Formazione                   ---*
        *---Archivio  - Archivio sequenziale         ---*
        *-----------------------------------------------*
COMME                                       UNIQUE
     A          R FILEREC
     A            FILEDAT1      10A         ALIAS(FILE_DATO_1)
     A                                      TEXT('DATO 1')
     A                                      COLHDG('DATO 1')
     A          K FILEDAT1
```
Un commento viene dichiarato con ```*---``` e non deve essere necessariamente chiuso.
 - Procedura: l’argomento della release. Serve per distinguere se verrà utilizzata o meno da ogni cliente in base ai moduli acquistati (eg. tipo di finanziamento);
 - Area: contesto;
 - Archivio: Tipo di file

Il codice:
- I primi 5 spazi dopo il numero della riga è uno spazio per i commenti
- ```UNIQUE``` (colonna 45) indica che un archivio è a chiave unica
- ```A``` (colonna 6) indica che quella riga è attiva e verrà elaborata dal sistema.
- ```R``` (colonna 17): segnala che la riga definisce  formato o nome (max 10) di record
- ```K``` archivio chiave ordinato dal campo chiave FILEDAT1

Ci sono 3 campi obligatori:
 - nome
 - la natura del campo: 
   - ```10A``` dice 10 campi alfanumerici (Maiuscolo è diverso dal minuscolo)
   - ```10S``` 10 numerici. L'ultimo bite aggiuntivo è il segno
   - ```5S 2``` lungo 5 con 2 decimali

3 facoltativi:
 - ```ALIAS```: un identificativo più lungo di 10 caratteri. Non va usato lo spazio, ma l'```_```.
 - ```COLHDG```: descrizione che viene visualizzato in interfacce visuali
 - ```TEXT```: descrizione, vale come un commento

```crtpf``` + F4 -> creazione file fisico (CRTPF).
F10 apre impostazioni avanzate
 - oggetto nome (sorgente/membro e oggetto devono avere nomi uguali)
 - in che libreria (```GIULIOS```)
 - file origine è la cartella (```QPFSRC```)
 - in membro origine ```*FILE``` si riferisce al nome file
 - numero massimo di membri:       ```*nomax```
 - numero iniziale record:         ```*nomax```
 - tempo massimo di attesa record: ```*nomax```
 - controllo livello form record:  ```*no```
 - riutilizzo record cancellati: ```*YES```

**OCSSY401** è una libreria dove ci stanno file cobol e sorgenti

Per consultare il contenuto di un archivio:
- ```upddta```
  - f10 immissione
  - col tasto PAG si scorre un file
  - SHIFT+F11 -> elimina un campo
- ```wrkf``` per visualizzare un file.

In **bianco** è indicato un dato chiave che decide l'ordine (se è letterale è ordinato per numero)

Anche gli archivi fisici con una chiave hanno un sorgente nella ```SPFSRC```

## spool
Spool è la stampa.
```wrksplf``` / ```WRKSPLF SELECT(GIULIOS)```
```SP``` sul file porta allo spool

## Dizionario
Il dizionario è un oggetto privo di membri ed è sempre nel ```QPFSRC```.
Esempio:
```COBOL
      A          R DIZIONARIO
      A            CAMPO_TIPO1    10A    COLHDG('Tipo 1')
      A            CAMPO_TIPO2     5S 0  COLHDG('Tipo 2')
                  *--- 5 CIFRE 0 decimali 
      A            CAMPO_TIPO3    30A    COLHDG('Tipo 3')
```

Per riferirsi a un dizionario:
```COBOL
      A                                 UNIQUE
      A          R PRINCIPALE           REF(DIZIONARIO)
      A            CAMPO1               REFFLD(CAMPO_TIPO1)
      A          K CAMPO1
```
 - ```REFFLD``` (Ref-field) indica un campo nel dizionario. 
 - ```REF(DIZIONARIO)``` - sotto unique

```crtpf``` membro su ```*none```

```edtlibl``` bisogna mettere in testa la libreria (GIULIOS)

Membro se desiderato su ```*FILE``` in tutti gli altri casi

```DSPOBJD``` (Display Object Descriptions, Tasto 8) : Per sapere un oggetto a quale sorgente punta bisogna guardare ```File origine``` compilando:
 - oggetto: ```FILE1```
 - tipo oggetto: ```*FILE```

## Denominazioni
 - NOME File fisico: ```FOcnFxxx```
 - RECORD: ```FOcnxxxREC```
 - CAMPO/colonna: ```FOcnxxxaaa``` 
   - aaa è il nome del campo
 - ALIAS: ```FOcnxxx_CODICE```
 - NOME File logico: ```FOcnFxxxXn```
 
ocssy401

INCV
 - modulo intermediari
 - divisione successiva
 - ```F``` è un file fisico. ```V``` è Maschera video, etc.
 - NUM = numeratori (cosa contiene)

## importare record da altri file
Per importare un record da un altro file, posso usare il comando ```FORMAT```:
```COBOL
                  UNIQUE
R NUOVO_RECORD    FORMAT(NOME_FILE_ORIGINE)
K CAMPO_1
K CAMPO_2
```
NUOVO_RECORD stesso nome di record nel file di origine


## Viste logiche (LF)
Permette di avere viste diverse di un file. Crea una sorta di puntatori a righe specifiche di codice che soddisfano determinate condizioni.
```COBOL
     A                                      UNIQUE
     A          R NUOVO_RECORD              PFILE(NOME_FILE_ORIGINE)
     A          K CAMPO_1
     A          K CAMPO_2
     A          S CAMPO_1                   COMP(NE 0)
```
Se metto ```UNIQUE``` nella vista logica, si riflette nel file.
FORMAT
```COMP``` (compare) dice una condizione che dice NOT EQUAL 0. Invece che ```S``` si può usare ```O``` (omit)
 - ```GT```: > 
 - ```LS```: <
 - ```LE```: <=
 - ```GE```: >=

```crtlf``` (o numero ```14```) 
 - numero massimo di membri:       ```*nomax```
 - tempo massimo di attesa record: ```*nomax```
 - controllo livello form record:  ```*no```

Devo cancellare le viste logiche per cancellare il file
```DSPDBR``` (Display database relations) 

```CV``` confronta membri

## SQL
```strsql``` + F4

Gli importi vanno in centesimo di euro.

- ```SELECT Nome CONCAT ' ' CONCAT Cognome FROM Tabella WHERE Value IN (1, 3, 5)```
- ```BETWEEN 1 AND 2```
- ```SELECT UPPER(nome) AS nome_maiuscolo FROM clienti;```
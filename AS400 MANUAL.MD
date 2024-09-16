# Nozioni di AS400

 - ```signoff``` - per deloggarsi da terminale
 - ```CHGPWD``` - per cambiare password
 - SHIFT + Fn - formula i numeri superiori al 12 fino al 24.

L'asterisco in AS/400 può servire per ricerca di oggetti o parametri di comando: 
   - ad esempio, se cerchi un file usando MYFILE*, il sistema restituirà tutti i file che iniziano con MYFILE, come MYFILE1, MYFILEA, ecc.
   - ```*ALL```: Utilizzato per indicare che si desidera considerare tutti gli oggetti o tutti i valori possibili in un determinato contesto (eg. ```WRKOBJ OBJ(MYLIB/*ALL)```).

Molti comandi utilizzano acronimi che seguono una struttura ben definita per eseguire varie operazioni sul sistema
 - ```DSP``` (Display. eg. ```DSPJOB```, visualizza solo, non modifica)
 - ```WRK``` (Work with. eg. ```WRKLIB```, ```WRKOBJ```) - visualizzare e interagire con gli oggetti
 - ```CHG``` (Change. eg. ```CHGJOB```)
 - ```DLT``` (Delete)
 - ```CRT``` (Create. eg ```CRTJOBQ```, ```CRTLIB```)
 - ```END``` (End)
 - ```SND``` (Send)
 - ```STR``` (Start)
 - ```RST``` (Restore)
 - ```SAV``` (Save)
l'asterisco viene usato per specificare un valore speciale o una scelta predefinita: ```*ALL```, ```*NONE```, ```*CURRENT``` (contesto corrente o l'utente corrente), ```*SYSVAL```. 

## I tasti funzione
 - F1 - Help: Mostra la guida in linea per la schermata corrente o il comando che stai utilizzando. 
 - F2 - Change: Permette di modificare le informazioni nella schermata corrente.
 - F3 - Exit: Esce dalla schermata corrente o annulla l'operazione in corso.
 - F4 - Prompt: Mostra i parametri di input per il comando corrente, consentendo di inserire i valori richiesti.
 - F5 - Refresh: Ricarica la schermata corrente, utile per aggiornare le informazioni visualizzate.
 - F6 - Create: Permette di creare nuovi oggetti, come file, librerie, ecc.
 - F7 - Scroll Up: Scorre verso l'alto nella schermata corrente.
 - F8 - Scroll Down: Scorre verso il basso nella schermata corrente.
 - F9 - ripete l'ultimo comando.
 - F10 - Display/Hide Menu: Mostra o nasconde il menu principale nella schermata corrente.
 - F12 - Cancel: Annulla l'operazione corrente o torna alla schermata precedente.

## GO
Il comando ```GO``` è utilizzato per accedere a un menu o una sottosistema di comandi di opzioni e comandi specifici che puoi eseguire.
 - ```GO``` - menù principale del sistema
 - ```GO MENU``` - menù personale
 - ```GO PROGRAM``` - menù per la gestione dei programmi
 - ```GO MAIN``` - menu principale standard del sistema

## WRKOBJ
Un oggetto è qualsiasi elemento del sistema che può essere creato, gestito o utilizzato.
Gli OBJ sono per esempio file, programmi, librerie e altre risorse, memorizzati permanentemente su disco:
 - Libreria (```*LIB```. Nota: le librerie non possono contenere altre librerie)
 - File (```*FILE```)
 - Programma (```*PGM```)
 - Area dati (```*DTAARA```)
 - Coda di output (```*OUTQ```)

```BASH
WRKOBJ OBJ(oggetto/libreria) OBJTYPE(*tipo)
```
 - ```OBJ``` - nome dell'oggetto che vuoi cercare. * per cercare con un certo pattern.
 - ```OBJTYPE``` - il tipo di oggetto (ad esempio, ```*PGM``` per programmi, ```*FILE``` per file, ```*LIB``` per librerie, etc.).

```WRKJOB``` + F4 - menu per inserire parametri del comando senza bisogno di conoscerli a memoria (nome, libreria e tipo). 

## I Jobs
I jobs su IBM i (AS/400) sono processi o attività che il sistema esegue.
Ci sono diversi tipi:
 - Job interattivi (iniziano con ```INTER```. Richiedono l'interazione dell'utente. Per esempio il login di un utente)
 - Job batch ( per operazioni programmate o lunghe. Lanciati dalla Job Queue)
 - Job di sistema (iniziano con ```Q```. Per esempio ```QINTER``` è un sottosistema che gestisce job interattivi)
 - Job di comunicazione (trasferimento dati (come FTP o SNA))
 - Job di spool (stampanti o altri dispositivi di output)

Componenti di un Job:
 - Job Name
 - Job Number (Numero univoco assegnato automaticamente dal sistema)
 - User (utente che ha avviato il job o sotto il quale è eseguito)
 - Job Queue (in che ordine e quando sarà eseguito (soprattutto per i job batch)).
 - Job Description (percorsi del file, le librerie da usare e altre risorse).

Diversi stati del job:
 - ```ACTIVE```
 - ```WAITING```
 - ```HELD``` (pausa)
 - ```COMPLETED```
 - ```ENDED``` (terminato manualmente o automaticamente)

```DSPJOB```: È principalmente per visualizzare informazioni dettagliate su un job. È un comando di sola lettura che fornisce una panoramica dettagliata del job.
```WRKJOB```, al contrario di DSPJOB (per visualizzare informazioni dettagliate su un job), è utilizzato per gestire i job: visualizzare un elenco di job, eseguire operazioni, e gestirli.
@echo off
title Esegui cobc e apri prova.exe
cobc -v >nul 2>&1
if errorlevel 1 (
    echo Errore: COBOL non è installato o non è nel PATH.
    pause
    exit /b 1
)

set "ultimo_nome_file="
set prev_compile=True

:loop
@echo off
setlocal enabledelayedexpansion
set /p nome_file="Nome file (nome/T/h/exit): "

if "%nome_file%"=="" (
    set "nome_file=%ultimo_nome_file%"
    if "%nome_file%"=="" (
        echo Nessun nome file precedentemente inserito.
        goto loop
    )
    echo Utilizzo dell'ultimo nome file: %nome_file%
) else (
    set "ultimo_nome_file=%nome_file%"
)

set "nome_file_lc="
call :to_lower2 %nome_file% nome_file_lc

if exist "%nome_file%.cob" (
    if exist "%nome_file%.exe" (
        :ask_recompile
        setlocal enabledelayedexpansion
        set /p risposta="Vuoi ricompilare %nome_file%.cob? (S/N/T/back): "
        set "risposta_lc="
	if /i "!risposta!"=="" (
	    if /i "!prev_compile!"=="True" (
	    	goto compile
	    ) else (
	    	goto esegui
	    )
	)
        call :to_lower2 !risposta! risposta_lc

        if /i "!risposta!"=="s" (
            goto compile
        ) else if /i "!risposta!"=="t" (
            set prev_run=True
            goto terminal
        ) else if /i "!risposta!"=="back" (
            goto loop
        ) else if /i "!risposta!"=="n" (
            set prev_run=False
            goto esegui
        ) else (
            echo Opzione non valida.
            goto ask_recompile
        )
    ) else (
        goto compile
    )
) else if /i "%nome_file_lc%"=="t" (
    goto terminal
) else if /i "%nome_file_lc%"=="h" (
    goto terminal
) else if /i "%nome_file_lc%"=="exit" (
    goto terminal_close
) else (
    echo File %nome_file%.cob non trovato.
    goto loop
)

:esegui
endlocal
cls
"%nome_file%.exe"
if %errorlevel% neq 0 (
    echo Errore durante l'esecuzione di %nome_file%.exe.
    pause
    goto loop
)
echo(
goto loop

:compile
<nul set /p ="Compilo %nome_file%.exe"
for /L %%i in (1,1,3) do (
    <nul set /p =.
    timeout /t 1 /nobreak >nul
)
echo.
cobc -x -o "%nome_file%.exe" "%nome_file%.cob"
if %errorlevel% neq 0 (
    echo Errore durante la compilazione di %nome_file%.cob.
    pause
    goto loop
)
goto esegui

:terminal
cls
echo cobc -v 	       per vedere la versione di cobol installata.
echo cobc -m file.cob  per compilare subroutine.
echo cobc -x file.cob  per compilare programma.
echo fsutil file createnew file.dat 2000.
echo file per eseguire.
timeout /t 3 /nobreak >nul
start cmd /k
goto loop

:: Funzione per convertire una stringa in minuscolo
:to_lower2
set input_string=%1
set "output_string="
for /l %%i in (0,1,8191) do (
    set "char=!input_string:~%%i,1!"
    if "!char!"=="" goto done
    for %%A in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        if "!char!"=="%%A" set "char=%%A" & set "char=!char:A=a!"
        if "!char!"=="%%A" set "char=!char:B=b!"
        if "!char!"=="%%A" set "char=!char:C=c!"
        if "!char!"=="%%A" set "char=!char:D=d!"
        if "!char!"=="%%A" set "char=!char:E=e!"
        if "!char!"=="%%A" set "char=!char:F=f!"
        if "!char!"=="%%A" set "char=!char:G=g!"
        if "!char!"=="%%A" set "char=!char:H=h!"
        if "!char!"=="%%A" set "char=!char:I=i!"
        if "!char!"=="%%A" set "char=!char:J=j!"
        if "!char!"=="%%A" set "char=!char:K=k!"
        if "!char!"=="%%A" set "char=!char:L=l!"
        if "!char!"=="%%A" set "char=!char:M=m!"
        if "!char!"=="%%A" set "char=!char:N=n!"
        if "!char!"=="%%A" set "char=!char:O=o!"
        if "!char!"=="%%A" set "char=!char:P=p!"
        if "!char!"=="%%A" set "char=!char:Q=q!"
        if "!char!"=="%%A" set "char=!char:R=r!"
        if "!char!"=="%%A" set "char=!char:S=s!"
        if "!char!"=="%%A" set "char=!char:T=t!"
        if "!char!"=="%%A" set "char=!char:U=u!"
        if "!char!"=="%%A" set "char=!char:V=v!"
        if "!char!"=="%%A" set "char=!char:W=w!"
        if "!char!"=="%%A" set "char=!char:X=x!"
        if "!char!"=="%%A" set "char=!char:Y=y!"
        if "!char!"=="%%A" set "char=!char:Z=z!"
    )
    set "output_string=!output_string!!char!"
)
:done
set "%2=%output_string%"
goto :eof

:terminal_close
<nul set /p ="Chiudo il terminale"
for /L %%i in (1,1,3) do (
    <nul set /p =.
    timeout /t 1 /nobreak >nul
)
echo.
exit /b

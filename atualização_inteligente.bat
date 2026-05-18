@echo off
@echo off
chcp 65001 >nul
:: ==================================================
:: NOME: Manutencao Segura do Windows
:: AUTOR: Lucas Lopes Moreira
:: ==================================================
title Manutencao Segura - Lucas Moreira
color 0A

:: VERIFICAR ADMIN
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [!] ERRO: Execute este arquivo como administrador.
    echo.
    pause
    exit
)

cls
echo ==================================================
echo      SISTEMA DE MANUTENÇÃO - BY LUCAS MOREIRA
echo ==================================================
echo.
:: ==================================================
:: VERIFICAR ADMIN
:: ==================================================

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Execute este arquivo como administrador.
    echo.
    pause
    exit
)

cls
echo ============================================
echo      MANUTENCAO SEGURA DO WINDOWS
echo ============================================
echo.
echo Este processo ira:
echo.
echo  [1] Atualizar aplicativos
echo  [2] Procurar atualizacoes do Windows
echo  [3] Reparar arquivos corrompidos
echo  [4] Limpar arquivos temporarios
echo.
pause

:: ==================================================
:: INTERNET
:: ==================================================

cls
echo [1/4] Verificando internet...

ping google.com -n 1 >nul

if errorlevel 1 (
    echo Sem conexao com a internet.
    pause
    exit
)

echo Internet OK.
timeout /t 2 >nul

:: ==================================================
:: WINGET
:: ==================================================

cls
echo [2/4] Atualizando aplicativos...
echo.

winget source update

winget upgrade --all ^
--accept-package-agreements ^
--accept-source-agreements

echo.
echo Aplicativos atualizados.
timeout /t 2 >nul

:: ==================================================
:: WINDOWS UPDATE
:: ==================================================

cls
echo [3/4] Procurando atualizacoes do Windows...
echo.

UsoClient StartScan

echo Verificacao iniciada.
timeout /t 3 >nul

:: ==================================================
:: DISM
:: ==================================================

cls
echo Reparando imagem do Windows...
echo.

DISM /Online /Cleanup-Image /RestoreHealth

:: ==================================================
:: SFC
:: ==================================================

cls
echo Verificando arquivos do sistema...
echo.

sfc /scannow

:: ==================================================
:: LIMPEZA TEMP
:: ==================================================

cls
echo [4/4] Limpando arquivos temporarios...
echo.

del /f /s /q "%temp%\*" >nul 2>&1

for /d %%x in ("%temp%\*") do rd /s /q "%%x" >nul 2>&1

echo.
echo Limpeza concluida.

:: ==================================================
:: FINAL
:: ==================================================

cls
echo ============================================
echo          PROCESSO FINALIZADO
echo ============================================
echo.
echo Seu Windows foi:
echo.
echo  Atualizado
echo  Reparado
echo  Limpo
echo.
echo Reiniciar o computador e recomendado.
echo.

pause
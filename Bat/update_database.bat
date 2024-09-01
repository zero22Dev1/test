@echo off

REM .envファイルを読み込む
for /f "tokens=* usebackq" %%i in (config.env) do set %%i

REM SQLファイルのパスを設定
SET SQL_FOLDER=sql-files

REM コマンドライン引数のチェック
IF "%~1"=="" (
    echo Usage: update_database.bat sql_file_name
    echo Example: update_database.bat update_1.sql
    exit /b 1
)

REM SQLファイルの存在チェック
SET SQL_FILE=%SQL_FOLDER%\%~1

IF NOT EXIST "%SQL_FILE%" (
    echo SQL file "%~1" does not exist in folder "%SQL_FOLDER%".
    exit /b 1
)

REM MySQLコマンドの実行
mysql -h %RDS_HOST% -P %RDS_PORT% -u %RDS_USER% -p%RDS_PASS% -D %RDS_DB% < "%SQL_FILE%"

REM 結果の表示
IF %ERRORLEVEL% EQU 0 (
    echo SQL execution succeeded.
) ELSE (
    echo SQL execution failed.
)

pause

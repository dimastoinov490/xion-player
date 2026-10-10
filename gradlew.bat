@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >nul 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%\bin\java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if ""%1""=="""" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

setlocal enabledelayedexpansion

for /F "usebackq delims=`" %%F in (`cd /d "%APP_HOME%" ^& dir /b`) do (
  if exist "%%F\gradle\wrapper\gradle-wrapper.jar" (
    set "CLASSPATH=%%F\gradle\wrapper\gradle-wrapper.jar"
    goto foundWrapper
  )
)

if exist "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" (
  set "CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar"
  goto foundWrapper
)

echo.
echo ERROR: JAVA_HOME is not set and no 'gradle' command could be found in your PATH.
echo.
goto fail

:foundWrapper
@rem Execute Gradle
"%JAVA_EXE%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %CMD_LINE_ARGS%

:end
@endlocal & set ERROR_CODE=%ERRORLEVEL%

if not "%ERROR_CODE%" == "0" (
  echo.
  echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
  echo.
  goto fail
)

exit /b %ERROR_CODE%

:fail
exit /b 1

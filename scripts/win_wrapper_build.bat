@echo off

SETLOCAL 

SET platform=AnyCPU

dotnet build dotnetOQS\dotnetOQS.csproj /p:Platform=%platform% -f netstandard1.2 -c Debug -o bin\Debug\dotnetOQS-wrapper-netstandard1.2
dotnet build dotnetOQS\dotnetOQS.csproj /p:Platform=%platform% -f netstandard2.0 -c Debug -o \bin\Debug\dotnetOQS-wrapper-netstandard2.0

dotnet build dotnetOQS\dotnetOQS.csproj /p:Platform=%platform% -f netstandard1.2 -c Release -o bin\Release\dotnetOQS-wrapper-netstandard1.2
dotnet build dotnetOQS\dotnetOQS.csproj /p:Platform=%platform% -f netstandard2.0 -c Release -o bin\Release\dotnetOQS-wrapper-netstandard2.0

ENDLOCAL
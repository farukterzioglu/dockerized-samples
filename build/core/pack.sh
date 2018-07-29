#!/bin/bash
#dosya unix formatta olmal?. notepad++ da aç?p sa? alt kö?eden kontrol edebilirsin.
#dotnet restore ./src/core -nowarn:msb3202,nu1503
#dotnet build ./src/core /p:Version=1.0.0 -c Release -o /app #$Version
#dotnet test ./test/core.Tests
#dotnet pack ./src/core /p:Version=1.0.0 -c Release -o /Package #$Version
#dotnet nuget push -h 
dotnet nuget push /Package/core.1.0.0.nupkg -k [apiKey] -s https://www.myget.org/F/tagging/api/v2/package

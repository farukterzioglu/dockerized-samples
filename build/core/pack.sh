#!/bin/bash
#dosya unix formatta olmal?. notepad++ da a�?p sa? alt k�?eden kontrol edebilirsin.
#dotnet restore ./src/core -nowarn:msb3202,nu1503
#dotnet build ./src/core /p:Version=1.0.0 -c Release -o /app #$Version
#dotnet test ./test/core.Tests
#dotnet pack ./src/core /p:Version=1.0.0 -c Release -o /Package #$Version
#dotnet nuget push -h 
dotnet nuget push /Package/core.1.0.0.nupkg -k 173b7e4d-e3df-4524-a21f-cab82ce15673 -s https://www.myget.org/F/tagging/api/v2/package
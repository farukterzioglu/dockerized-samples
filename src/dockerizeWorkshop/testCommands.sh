#!/bin/bash
dotnet test ./Tests --logger "trx;LogFileName=WebAppTests.Results.trx" -r "./TestResults"
#dotnet test ./app/tests/Tests --collect:"Code Coverage" --logger "trx;LogFileName=WebAppTests.Results.trx" -r "../../TestResults" --no-build
#dotnet test ./app/tests/WebAppTests --collect:"Code Coverage" --logger "trx;LogFileName=Tests.Results.trx" -r "../../TestResults" --no-build
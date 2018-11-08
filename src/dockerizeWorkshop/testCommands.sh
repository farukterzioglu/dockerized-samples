#!/bin/bash
dotnet test ./Tests --logger "trx;LogFileName=Tests.Results.trx" -r "../../TestResults"
dotnet test ./WebAppTests --logger "trx;LogFileName=WebAppTests.Results.trx" -r "../../TestResults"
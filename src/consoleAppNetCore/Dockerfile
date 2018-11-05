FROM microsoft/dotnet:2.1-sdk AS build
# WORKDIR /app
# COPY consoleAppNetCore.ConsoleApp/*.csproj ./ConsoleApp/
# WORKDIR /app/ConsoleApp
# RUN dotnet restore

WORKDIR /app
COPY consoleAppNetCore.ConsoleApp/. ./ConsoleApp/
WORKDIR /app/ConsoleApp
RUN dotnet publish -c Release -o ./out
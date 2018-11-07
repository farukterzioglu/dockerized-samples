FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app
COPY ConsoleApp/*.csproj ./ConsoleApp/
WORKDIR /app/ConsoleApp
RUN dotnet restore

WORKDIR /app
COPY ConsoleApp/. ./ConsoleApp/
WORKDIR /app/ConsoleApp
RUN dotnet publish -c Release -o ./out

FROM build AS testrunner
WORKDIR /app/tests
COPY Tests/. .
ENTRYPOINT ["dotnet", "test", "--logger:trx"]

FROM microsoft/dotnet:2.1-runtime AS runtime
WORKDIR /app
COPY --from=build /app/ConsoleApp/out ./
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]

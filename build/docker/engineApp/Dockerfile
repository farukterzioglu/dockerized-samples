#BUILD
FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /

#RESTORE
COPY . .
WORKDIR /src/engineApp
RUN dotnet restore -nowarn:msb3202,nu1503

#BUILD
WORKDIR /src/engineApp
RUN dotnet build -c Release -o /app

#RUN TESTS
FROM build as testrunner
WORKDIR /
ENTRYPOINT ["./build/unittest/engineAppTestCommands.sh"]

#PUBLISH
FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM microsoft/dotnet:2.1-runtime AS runtime
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "engineApp.dll"]
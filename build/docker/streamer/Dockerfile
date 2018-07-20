#BUILD
FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /

#RESTORE
COPY . .
WORKDIR /src/streamer
RUN dotnet restore -nowarn:msb3202,nu1503

#BUILD
WORKDIR /src/streamer
RUN dotnet build -c Release -o /app

#RUN TESTS
FROM build as testrunner
WORKDIR /test/streamer.Tests
#RUN dotnet test #activate if you want to fail the build process
ENTRYPOINT ["dotnet", "test", "--logger:trx"]

#PUBLISH
FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM microsoft/dotnet:2.1-runtime AS runtime
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "ReviewPurchaseVerifier.Consumer.dll"]

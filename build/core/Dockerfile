#TODO : Test this
#BUILD
FROM microsoft/dotnet:2.1-sdk AS build
ARG Version
WORKDIR /src
COPY . .
ENTRYPOINT ["sh", "./build/core/pack.sh"]


##PACK
#FROM build AS package
#RUN dotnet pack /p:Version=$Version -c Release -o /Package
#
##PUSH Nuget Package
#FROM package AS push
#RUN dotnet nuget push .\Package\core.1.0.0.nupkg -s http://nuget.hepsiburada.com/nuget
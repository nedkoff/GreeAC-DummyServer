# STAGE 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

COPY . ./

RUN dotnet restore
RUN dotnet publish -c Release -o /app -r linux-arm64 --self-contained false

# STAGE 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .

EXPOSE 5000
ENTRYPOINT ["dotnet", "DummyServer.dll"]

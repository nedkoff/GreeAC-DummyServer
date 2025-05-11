# STAGE 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

COPY *.csproj ./
RUN dotnet restore -r linux-arm

COPY . ./
RUN dotnet publish -c Release -o /app -r linux-arm --self-contained false --no-restore

# STAGE 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app .

EXPOSE 5000
ENV DOMAIN_NAME=emtek.at
ENV EXTERNAL_IP=172.16.1.1

ENTRYPOINT ["dotnet", "DummyServer.dll"]

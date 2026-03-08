# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.sln .
COPY DockerJenKinsTrainingWebApi/*.csproj ./DockerJenKinsTrainingWebApi/
RUN dotnet restore

# Copy the rest of the source code
COPY DockerJenKinsTrainingWebApi/. ./DockerJenKinsTrainingWebApi/

WORKDIR /app/DockerJenKinsTrainingWebApi
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/DockerJenKinsTrainingWebApi/out ./
ENTRYPOINT ["dotnet", "DockerJenKinsTrainingWebApi.dll"]
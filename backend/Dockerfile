# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Copy .csproj and restore as distinct layers
COPY ./*.sln ./
COPY ./Application/Application.csproj ./Application/
COPY ./Application.Tests/Application.Tests.csproj ./Application.Tests/
COPY ./Domain/Domain.csproj ./Domain/
COPY ./Infrastructure/Infrastructure.csproj ./Infrastructure/
COPY ./Persistence/Persistence.csproj ./Persistence/
COPY ./WebApi/WebApi.csproj ./WebApi/
RUN dotnet restore ./WebApi/WebApi.csproj

# Copy everything else and build
COPY . ./
RUN dotnet publish ./WebApi/WebApi.csproj -c Release -o /app/out

# Stage 2: Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build-env /app/out .

# Expose the port that the application runs on
EXPOSE 7081

# Set the entry point for the container
ENTRYPOINT ["dotnet", "WebApi.dll"]

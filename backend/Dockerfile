# Build a custom base image with the .NET SDK and EF tools
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS sdk-image
RUN dotnet tool install --global dotnet-ef --version 7.0.20
ENV PATH="${PATH}:/root/.dotnet/tools"

# Build the application
FROM sdk-image AS build-env
WORKDIR /app
# Copy all csproj files and restore as distinct layers
COPY ./*.sln ./
COPY ./Application/*.csproj ./Application/
COPY ./Application.Tests/*.csproj ./Application.Tests/
COPY ./Domain/*.csproj ./Domain/
COPY ./Infrastructure/*.csproj ./Infrastructure/
COPY ./Persistence/*.csproj ./Persistence/
COPY ./WebApi/*.csproj ./WebApi/
# Restore packages
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish ./WebApi/WebApi.csproj -c Release -o /app/out

# Use the custom SDK image with EF tools for runtime
FROM sdk-image
WORKDIR /app
COPY --from=build-env /app/out .

EXPOSE 8081
ENTRYPOINT ["/bin/bash", "-c", "dotnet ef database update --project ./Persistence/Persistence.csproj && dotnet WebApi.dll"]

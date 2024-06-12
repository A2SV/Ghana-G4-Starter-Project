
# Build the application
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app
COPY ./*.sln ./
COPY ./Application/*.csproj ./Application/
COPY ./Application.Tests/*.csproj ./Application.Tests/
COPY ./Domain/*.csproj ./Domain/
COPY ./Infrastructure/*.csproj ./Infrastructure/
COPY ./Persistence/*.csproj ./Persistence/
COPY ./WebApi/*.csproj ./WebApi/
RUN dotnet restore
COPY . ./
RUN dotnet publish ./WebApi/WebApi.csproj -c Release -o /app/out

# Final stage/image
FROM mcr.microsoft.com/dotnet/sdk:7.0
WORKDIR /app
COPY --from=build-env /app/out .

# Install EF tools
RUN dotnet tool install --global dotnet-ef --version 7.0.20
ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet ef --version

RUN ls 
# Copy and set permissions for the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Run the entrypoint script
CMD ["/app/entrypoint.sh"]

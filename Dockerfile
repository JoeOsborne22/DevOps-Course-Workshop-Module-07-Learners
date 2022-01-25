FROM mcr.microsoft.com/dotnet/sdk:5.0 as base 

WORKDIR /app

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

COPY . /app

RUN dotnet build

WORKDIR /app/DotnetTemplate.Web

#RUN npm install
RUN npm ci
RUN npm run build
RUN npm run lint
RUN npm t 

EXPOSE 5000

ENTRYPOINT [ "dotnet", "run" ]

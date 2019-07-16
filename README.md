# Taller Microservicios
En este tuturial se implementará un web api en docker y será desplegado en Azure Kubernetes Services. El objetivo de este tuturial
es mostrar las tecnologias utilizadas para el desarrollo de aplicaciones orientadas a microservicios.
## Requistos
Para seguir este tuturial debe tener lo siguiente
* Visual Studio 2019 (https://visualstudio.microsoft.com/es/vs/)
* Docker   (https://www.docker.com/products/docker-desktop)
* Terraform (https://www.terraform.io/)
* Azure CLI (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest)
## Preparar la aplicación para AKS
El proyecto utlizado para el tutorial es un proyecto básico creado en base a la plantilla API en Visual Studio y se ha configurado swagger para probar de forma facil el web api. 
<p>Este proyecto contiene el archivo <b>Dockerfile</b>, el cual nos va ha permitir incluir la aplicacion en una imagen de contenedor docker.
<p> Para construir y probar la imagen docker ejecutar los siguientes comandos
 ```
docker build -f webapi/dockerfile -t webapi:v1 .
docker run -p 5001:80 webapi:v1
```
<p> Ingresar a http://localhost:5001/swagger/index.html, para verificar que el contenedor se esté ejecutando
 
## Creación de un Service Principal

## Creación de infraestructura

## Configurar Services Principal

## Accediendo al Dashboard de Kubernetes

## Subir imagen docker a ACR

## Desplegar contenedor en AKS
 

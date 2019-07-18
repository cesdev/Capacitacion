# Taller Microservicios
En este tuturial se implementará un web api en docker y será desplegado en Azure Kubernetes Services. El objetivo de este tuturial
es mostrar las tecnologias utilizadas para el desarrollo de aplicaciones orientadas a microservicios.
## Requistos
Para seguir este tuturial debe tener lo siguiente
* NetCore SDK (https://dotnet.microsoft.com/download)
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

## Creación de infraestructura AKS
Para la creación del infraestructura utilizaremos Terraform. 

<p>Iniciar sesión en Azure con el siguiente comando

```
az login
```

<p>Crear el cluster aks con los siguientes commandos

```
terraform init
terraform plan
terraform apply
```

## Accediendo al Dashboard de Kubernetes
Para acceder al panel de control del cluster creado ejecutar los siguientes comandos

```
--INSTALAR AKS CLI
az aks install-cli

--CONFIGURAR AUTENTICACION AKS
az aks get-credentials --resource-group SampleResourceGroup --name SampleAKSCluster

--INICIAR DASBOARD
az aks browse --resource-group SampleResourceGroup --name SampleAKSCluster
```

## Subir imagen docker a ACR

## Desplegar contenedor en AKS
 

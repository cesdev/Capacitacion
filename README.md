# Taller Microservicios
En este tuturial se implementará un web api en docker y será desplegado en Azure Kubernetes Services. El objetivo de este tuturial
es mostrar las tecnologias utilizadas para el desarrollo de aplicaciones orientadas a microservicios.
## Requistos
Para seguir este tuturial debe tener lo siguiente
* NetCore SDK (https://dotnet.microsoft.com/download)
* Visual Studio Code (https://code.visualstudio.com)
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

<p> Ingresar a http://localhost:5001/swagger/index.html , para verificar que el contenedor se esté ejecutando

## Creación de infraestructura AKS
Para la creación del infraestructura utilizaremos Terraform. 
<p>La definición de la insfraestructura como codigo se encuentra en el archivo src/deployments/infrastructure/deployment.tf
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
<p>La creación del cluster tomara aproximadamente 7 minutos.
 
## Configurando Azure Container Register
Para que el cluster AKS tengo acceso al repositorio de imagenes creado ejecutar el siguiente comando

```
az role assignment create --assignee 71fbda64-7777-4e45-89a2-9b7e7b7e111b --scope /subscriptions/a78dd370-2e4d-44b3-a09f-74bcc3383653/resourceGroups/SampleResourceGroup/providers/Microsoft.ContainerRegistry/registries/sampleACR --role acrpull
```
 
## Accediendo al Dashboard de Kubernetes
Para acceder al panel de control del cluster AKS ejecutar los siguientes comandos

```
--INSTALAR AKS CLI
az aks install-cli

--CONFIGURAR AUTENTICACION AKS
az aks get-credentials --resource-group SampleResourceGroup --name SampleAKSCluster

--INICIAR DASBOARD
az aks browse --resource-group SampleResourceGroup --name SampleAKSCluster
```
<p>Se abrirá automáticamente el navegador con el panel de control del cluster AKS

## Subir imagen docker a ACR
<p>Para subir la imagen docker que contiene la aplicación al repositorio de Azure ejecutar lo siguiente
 
 ```
--INICIAR SESION EN ACR 
az acr login --name sampleACR

--TAG IMAGEN
docker tag webapi sampleACR.azurecr.io/webapi:v1

--SUBIR imagen
docker push sampleaACR.azurecr.io/webapi:v1
```

## Desplegar contenedor en AKS
Finalmente desplegamos la imagen subida al repositorio ACR, con los siguientes comandos

```
kubectl apply -f webapi.yaml
kubectl get service web-api --watch
```

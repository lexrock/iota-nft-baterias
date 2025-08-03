## Roadmap del proyecto

Este proyecto forma parte de un estudio de investigación (doctorado) sobre la reutilización de baterías mediante tokenización en IOTA.  

Las fases previstas son:

1. **Fase 1** – Montaje de un nodo Hornet privado en Raspberry Pi (completada fuera de este repositorio).
2. **Fase 2** – Desarrollo del cliente en Node.js para conectarse al nodo Hornet (este repositorio).
3. **Fase 3** – Gestión de wallets y direcciones.
4. **Fase 4** – Creación y gestión de NFTs para representar baterías.
5. **Fase 5** – Implementación del marketplace descentralizado.


# iota-nft-baterias

Este proyecto es el entorno de desarrollo para crear un sistema basado en **IOTA** para la gestión de NFTs y tokens de baterías reutilizadas. Está diseñado para usarse en entornos donde el nodo está accesible por Tailscale o en la misma red local.

## 1. Requisitos previos

Antes de empezar asegúrate de tener instalados en tu máquina:

- **Docker y Docker Compose**  
  - [Docker Desktop](https://www.docker.com/products/docker-desktop/) para Windows/Mac  
  - En Linux:
    ```bash
    sudo apt update
    sudo apt install docker.io docker-compose-plugin
    sudo usermod -aG docker $USER
    ```
    Después de esto, reinicia la sesión.
  - Tailscale
  - Un nodo Hornet accesible desde tu máquina (por ejemplo, usando Tailscale)


- **Git**  
  En Linux:
  ```bash
  sudo apt install git

  # Cliente IOTA para nodo Hornet (Docker + Node.js)


## 2. Archivos principales

- **index.js**  
  Contiene el código para conectarse al nodo Hornet usando `@iota/sdk`.
    **Nota:** Si el nodo aparece como `isHealthy: false`, solo podrás conectarte y leer información básica.  
    Para operaciones de transacciones, asegúrate de que el nodo está completamente sincronizado. De ahí el comando `ignoreNodeHealth: true`


- **package.json**  
  Define las dependencias del proyecto.

- **Dockerfile**  
  Construye la imagen de Node.js para ejecutar el cliente.

- **.dockerignore**  
  Ignora archivos innecesarios para acelerar la construcción de la imagen.

---

## 3. Configuración

1. Clona este repositorio:
    git clone git@github.com:TU_USUARIO/iota-nft-baterias.git
    cd iota-nft-baterias

2. Edita index.js y cambia la constante NODE_URL por la dirección de tu nodo Hornet:
    const NODE_URL = "http://100.94.154.44:14265";

3. Construye la imagen Docker:
    docker build -t iota-nft .

4. Ejecuta el contenedor:
    docker run --rm --network host iota-nft

## 3. CComandos últiles de Docker

    Eliminar contenedores e imágenes en conflicto:

        docker stop $(docker ps -aq) || true
        docker system prune -af

    Reconstruir desde cero:

        docker build --no-cache -t iota-nft .
        docker run --rm --network host iota-nft


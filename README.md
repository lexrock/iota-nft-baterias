# IOTA NFT Baterías - Roadmap del proyecto

Este proyecto forma parte de un estudio de investigación y doctorado cuyo objetivo es:

- Desarrollar un **sistema basado en blockchain (IOTA)** para:
  - Tokenizar baterías reutilizadas.
  - Crear un **mercado de intercambio de tokens**.
  - Generar ingresos con la productividad de esas baterías reutilizadas (energía almacenada, economía circular).

El sistema está dividido en varias fases:

## **Fases del proyecto**

### Fase 1 - Nodo Hornet
- Desplegar un nodo Hornet (en Raspberry Pi usando Docker).
- Dejarlo sincronizado (healthy).

### Fase 2 - Cliente
- Crear un cliente en Node.js que se conecte al nodo Hornet.
- Probar conexión, leer información del nodo y sentar las bases para trabajar con la API.

### Fase 3 - Wallet y tokens
- Crear o integrar una **wallet** conectada al nodo.
- Manejar balances, transferencias y creación de NFTs.

### Fase 4 - Mercado
- Implementar un marketplace donde se intercambien NFTs de baterías y se gestionen las transacciones.

## **Repositorios y ramas**

- `fase1-hornet-node`: configuración y despliegue del nodo Hornet.
- `fase2-cliente`: cliente Node.js conectado al nodo Hornet.
- `main`: documentación general.

Cada fase se mantiene aislada en su propia rama para evitar errores y poder hacer rollback si algo falla.


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
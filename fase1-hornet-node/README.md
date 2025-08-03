# Fase 1 - Nodo Hornet

Este proyecto contiene los archivos necesarios para levantar un nodo **Hornet** en una Raspberry Pi usando Docker.

## **Requisitos**

- Docker y Docker Compose instalados en la Raspberry.
- Acceso a Internet estable.

## **Instrucciones**

1. Clona la rama:

    git clone -b fase1-hornet-node git@github.com:lexrock/iota-nft-baterias.git
    cd iota-nft-baterias

2. Levanta el nodo:
    
    docker-compose up -d

3. Comprueba que funciona:

    curl http://localhost:14265/api/core/v2/info

4. Si isHealthy es false, descarga el snapshot más reciente:

    docker-compose down
    curl -L https://dbfiles.iota.org/mainnet/hornet/latest-full_snapshot.bin -o snapshot.bin
    sudo rm -rf db/*
    mkdir -p snapshots/mainnet
    mv snapshot.bin snapshots/mainnet/full_snapshot.bin
    docker-compose up -d

## **Limpiar contenedores Docker**

    Eliminar contenedores e imágenes en conflicto:

        docker stop $(docker ps -aq) || true
        docker system prune -af

    Reconstruir desde cero:

        docker build --no-cache -t iota-nft .
        docker run --rm --network host iota-nft
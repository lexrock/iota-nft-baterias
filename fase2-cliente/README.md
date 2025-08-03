
# Fase 2 - Cliente


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
    **Nota:**  --network host permite que el contenedor use la red de la máquina host y pueda acceder a nodos en la misma red o Tailscale.
## 3. Comandos últiles de Docker

    Eliminar contenedores e imágenes en conflicto:

        docker stop $(docker ps -aq) || true
        docker system prune -af

    Reconstruir desde cero:

        docker build --no-cache -t iota-nft .
        docker run --rm --network host iota-nft

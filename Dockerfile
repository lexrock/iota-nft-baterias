# Imagen basada en Debian 12 (Bookworm) en lugar de Bullseye
FROM node:20-bookworm

# 1. Instalar dependencias necesarias para compilar el SDK
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    python3 \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Instalar Rust (para compilar iota-sdk)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# 3. Crear directorio de la app
WORKDIR /app

# 4. Copiar package.json y tsconfig.json
COPY package*.json ./
COPY tsconfig.json ./

# 5. Instalar dependencias
RUN npm install

# 6. Copiar el resto del proyecto
COPY . .

EXPOSE 3000

CMD ["npm", "start"]

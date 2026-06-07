# syntax=docker/dockerfile:1

# ---- Stage de dependências ----
FROM node:22-alpine AS deps
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# ---- Stage final ----
FROM node:22-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app

# Dependências já resolvidas
COPY --from=deps /usr/src/app/node_modules ./node_modules

# Código da aplicação (static/, views/, models/, etc.)
COPY . .

# Executa como usuário não-root
USER node

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
    CMD node -e "require('http').get('http://localhost:8080/health',r=>process.exit(r.statusCode===200?0:1)).on('error',()=>process.exit(1))"

CMD ["node", "server.js"]

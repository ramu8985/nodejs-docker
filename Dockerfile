FROM node:19-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 80

FROM base AS final
RUN npm install --production
COPY . .
CMD ["node","index.js"]

FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY app.js ./

EXPOSE 3001

ENV PORT=3001

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3001/ || exit 1

CMD ["npm", "start"]

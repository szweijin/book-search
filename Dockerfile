# 建立階段
FROM node:20 AS build-stage
WORKDIR /app
COPY . .
RUN npm install && npm run build

# 部署階段
FROM nginx:alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Optional: 加入自定義 Nginx 設定
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

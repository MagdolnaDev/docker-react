## Step 1 - build our app
## ----------------------
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- production files and folders


## Step 2 - build nginx
## ----------------------
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

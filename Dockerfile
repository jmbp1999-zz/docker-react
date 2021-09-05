FROM node:alpine as builder
WORKDIR ./app
COPY package.json ./
RUN npm install
COPY ./ ./
CMD ["npm","run","build"]
RUN npm run build


#./app/build is where all the build files are.



FROM nginx
COPY --from=builder ./app/build ./usr/share/nginx/html
FROM node:14
WORKDIR /app
COPY . /app
RUN npm install
EXPOSE 80
CMD ["node", "app.js","runserver","80:80"]

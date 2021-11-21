FROM osgeo/gdal:ubuntu-full-latest
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

WORKDIR /usr/app
COPY yarn.lock package.json ./
RUN yarn
COPY . .
ENTRYPOINT node src/index.js
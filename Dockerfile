FROM osgeo/gdal:ubuntu-full-latest
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add
RUN sudo apt update && apt install -y yarn
WORKDIR /usr/app
COPY ["yarn.lock","package.json"] .
RUN yarn
COPY . .
ENTRYPOINT node src/index.js
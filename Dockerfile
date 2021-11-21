FROM osgeo/gdal:ubuntu-full-latest
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn
WORKDIR /usr/app
COPY ["yarn.lock","package.json"] .
RUN yarn
COPY . .
ENTRYPOINT node src/index.js
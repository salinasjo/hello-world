FROM gradle
RUN mkdir /home/gradle
WORKDIR /home/gradle
VOLUME ./
COPY ./ /home/gradle

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install php openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip gzip -yq --no-install-recommends

RUN gradle publish --no-daemon --info
RUN ls ./build
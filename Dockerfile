FROM appscode/golang-agent:1.5

RUN set -x \
  && mkdir -p /opt/protoc \
  && cd /opt/protoc \
  && curl -fsSOL https://github.com/google/protobuf/archive/v3.0.0.tar.gz \
  && tar -xzvf v3.0.0.tar.gz --strip-component=1 \
  && ./autogen.sh \
  && ./configure \
  && make \
  && make check \
  && make install \
  && ldconfig

RUN set -x \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

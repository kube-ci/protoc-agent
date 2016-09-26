FROM appscode/golang-agent:1.7

RUN set -x \
  && mkdir -p /opt/protoc \
  && cd /opt/protoc \
  && curl -fsSOL https://github.com/google/protobuf/archive/v3.0.2.tar.gz \
  && tar -xzvf v3.0.2.tar.gz --strip-component=1 \
  && rm v3.0.2.tar.gz \
  && ./autogen.sh \
  && ./configure \
  && make \
  && make check \
  && make install \
  && ldconfig

RUN set -x \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

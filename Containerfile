# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

ARG \
    BASE_IMAGE

FROM ${BASE_IMAGE}

LABEL \
        org.opencontainers.image.title="Zabbix" \
        org.opencontainers.image.description="Containerized Monitoring Platform" \
        org.opencontainers.image.url="https://hub.docker.com/r/nfrastack/zabbix" \
        org.opencontainers.image.documentation="https://github.com/nfrastack/container-zabbix/blob/main/README.md" \
        org.opencontainers.image.source="https://github.com/nfrastack/container-zabbix.git" \
        org.opencontainers.image.authors="Nfrastack <code@nfrastack.com>" \
        org.opencontainers.image.vendor="Nfrastack <https://www.nfrastack.com>" \
        org.opencontainers.image.licenses="MIT"

ARG \
    ZABBIX_VERSION="7.4.7" \
    ZABBIX_REPO_URL="https://github.com/zabbix/zabbix"

COPY CHANGELOG.md /usr/src/container/CHANGELOG.md
COPY LICENSE /usr/src/container/LICENSE
COPY README.md /usr/src/container/README.md

ENV \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_MODULE_ENABLE_LDAP=TRUE \
    PHP_MODULE_ENABLE_SOCKETS=TRUE \
    PHP_MODULE_ENABLE_XMLWRITER=TRUE \
    NGINX_SITE_ENABLED=zabbix \
    NGINX_WEBROOT=/www/zabbix \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="nfrastack/zabbix" \
    IMAGE_REPO_URL="https://github.com/nfrastack/container-zabbix/"

RUN echo "" && \
    ZABBIX_BUILD_DEPS_ALPINE=" \
                                alpine-sdk \
                                autoconf \
                                automake \
                                coreutils \
                                curl-dev \
                                g++ \
                                git \
                                go \
                                libevent-dev \
                                libssh-dev \
                                libxml2-dev \
                                linux-headers \
                                make \
                                net-snmp-dev \
                                openipmi-dev \
                                openldap-dev \
                                pcre2-dev \
                                postgresql-dev \
                                sqlite-dev \
                                unixodbc-dev \
                            " \
                        && \
    ZABBIX_RUN_DEPS_ALPINE=" \
                                chromium \
                                fping \
                                iputils \
                                libcurl \
                                libevent \
                                libldap \
                                libssh \
                                libxml2 \
                                net-snmp-agent-libs \
                                nmap \
                                openipmi-libs \
                                openssl \
                                pcre2 \
                                postgresql-client \
                                postgresql-libs \
                                py3-openssl \
                                py3-pip \
                                py3-requests \
                                python3 \
                                sqlite-libs \
                                unixodbc \
                                whois \
                        " \
                    && \
    \
    source /container/base/functions/container/build && \
    container_build_log image && \
    package update && \
    package upgrade && \
    package install \
                        ZABBIX_BUILD_DEPS \
                        ZABBIX_RUN_DEPS \
                        && \
    \
    php-ext prepare && \
    php-ext reset && \
    php-ext enable core && \
    mkdir -p \
            /etc/zabbix \
            /usr/lib/zabbix/alertscripts \
            /usr/lib/zabbix/externalscripts \
            /usr/share/doc/zabbix-server/sql/postgresql \
            /var/lib/zabbix \
            /var/lib/zabbix/enc \
            /var/lib/zabbix/export \
            /var/lib/zabbix/mibs \
            /var/lib/zabbix/modules \
            /var/lib/zabbix/snmptraps \
            /var/lib/zabbix/ssh_keys \
            /var/lib/zabbix/ssl \
            /var/lib/zabbix/ssl/certs \
            /var/lib/zabbix/ssl/keys \
            /var/lib/zabbix/ssl/ssl_ca \
            && \
    \
    clone_git_repo "${ZABBIX_REPO_URL}" "${ZABBIX_VERSION}" && \
    sed -i "s|{ZABBIX_REVISION}|$(git log | head -n 1 | awk '{print $2}')|g" include/version.h  && \
    ./bootstrap.sh && \
    export CFLAGS="-fPIC -pie -Wl,-z,relro -Wl,-z,now" && \
    sed -i "s|CGO_CFLAGS=\"\${CGO_CFLAGS}\"| CGO_CFLAGS=\"-D_LARGEFILE64_SOURCE \${CGO_CFLAGS}\"|g" /usr/src/zabbix/src/go/Makefile.am && \
    ./configure \
            --datadir=/usr/lib \
            --libdir=/usr/lib/zabbix \
            --prefix=/usr \
            --sysconfdir=/etc/zabbix \
            --enable-agent \
            --enable-agent2 \
            --enable-server \
            --enable-webservice \
            --with-postgresql \
            --with-ldap \
            --with-libcurl \
            --with-libxml2 \
            --with-net-snmp \
            --with-openipmi \
            --with-openssl \
            --with-ssh \
            --with-unixodbc \
            --enable-ipv6 \
            --silent && \
    make -j"$(nproc)" -s dbschema && \
    make -j"$(nproc)" -s && \
        ./configure \
            --datadir=/usr/lib \
            --libdir=/usr/lib/zabbix \
            --prefix=/usr \
            --sysconfdir=/etc/zabbix \
            --enable-proxy \
            --with-sqlite3 \
            --with-ldap \
            --with-libcurl \
            --with-libxml2 \
            --with-net-snmp \
            --with-openipmi \
            --with-openssl \
            --with-ssh \
            --with-unixodbc \
            --enable-ipv6 \
            --silent && \
    make -j"$(nproc)" -s dbschema && \
    make -j"$(nproc)" -s && \
    cp src/zabbix_proxy/zabbix_proxy /usr/sbin/zabbix_proxy && \
    cp src/zabbix_get/zabbix_get /usr/bin/zabbix_get && \
    cp src/zabbix_sender/zabbix_sender /usr/bin/zabbix_sender && \
    cp src/zabbix_agent/zabbix_agentd /usr/sbin/zabbix_agentd && \
    cp src/zabbix_get/zabbix_get /usr/sbin/zabbix_get && \
    cp src/zabbix_sender/zabbix_sender /usr/sbin/zabbix_sender && \
    cp src/go/bin/zabbix_agent2 /usr/sbin/zabbix_agent2 && \
    cp src/zabbix_server/zabbix_server /usr/sbin/zabbix_server && \
    cp -R database/postgresql /usr/share/doc/zabbix-server/sql && \
    mv ui "${NGINX_WEBROOT}" && \
    chown -R "${NGINX_USER}":"${NGINX_GROUP}" "${NGINX_WEBROOT}" && \
    chown --quiet -R zabbix:root \
                       /etc/zabbix/ \
                       /var/lib/zabbix/ && \
    container_build_log add "Zabbix" "${ZABBIX_VERSION}" "${ZABBIX_REPO_URL}" && \
    package remove \
                    ZABBIX_BUILD_DEPS \
                    && \
    package cleanup

COPY rootfs /

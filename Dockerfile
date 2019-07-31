FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive \
    OV_PASSWORD=admin \
    PUBLIC_HOSTNAME=openvas

RUN apt-get update && \
    apt-get install software-properties-common --no-install-recommends -yq && \
    add-apt-repository ppa:mikesplain/openvas -y && \
    add-apt-repository ppa:mrazavi/openvas -y && \
    apt-get clean && \
    apt-get update && \
    apt-get install alien \
        autotools-dev \
        bind9-host \
        binutils \
	bison \
        bsdmainutils \
        build-essential \
        bzip2 \
        ca-certificates \
        cmake \
	cpio \
        cpp \
        cpp-5 \
        curl \
        debhelper \
        debugedit \
        dh-python \
        dh-strip-nondeterminism \
        dirb \
        dirmngr \
        dnsutils \
        dpkg-dev \
        fakeroot \
        file \
        fontconfig \
        fontconfig-config \
        fonts-dejavu-core \
        fonts-lato \
        fonts-liberation \
        fonts-lmodern \
        fonts-texgyre \
        g++ \
        g++-5 \
        gcc \
        gcc-5 \
        geoip-database \
        gettext \
        gettext-base \
        ghostscript \
        gir1.2-glib-2.0:amd64 \
        git \
	gnupg-agent \
        gnupg2 \
        gnutls-bin \
        graphviz \
        groff-base \
        gsfonts \
        hicolor-icon-theme \
        ifupdown \
        intltool-debian \
        iproute2 \
        isc-dhcp-client \
        isc-dhcp-common \
        javascript-common \
        ldap-utils \
	libpcap-dev \
	libssh-dev \
	libhiredis-dev \
	uuid-dev \
	libksba-dev \
        libalgorithm-diff-perl \
        libalgorithm-diff-xs-perl \
        libalgorithm-merge-perl \
        libapr1:amd64 \
        libaprutil1:amd64 \
        libarchive-zip-perl \
        libarchive13:amd64 \
        libasan2:amd64 \
        libasn1-8-heimdal:amd64 \
        libasprintf-dev:amd64 \
        libasprintf0v5:amd64 \
        libassuan0:amd64 \
        libatk1.0-0:amd64 \
        libatk1.0-data \
        libatm1:amd64 \
        libatomic1:amd64 \
        libauthen-sasl-perl \
        libavahi-client3:amd64 \
        libavahi-common-data:amd64 \
        libavahi-common3:amd64 \
        libbind9-140:amd64 \
        libblas-common \
        libblas3 \
        libbsd0:amd64 \
        libc-dev-bin \
        libc6-dev:amd64 \
        libcairo2:amd64 \
        libcc1-0:amd64 \
        libcdt5 \
        libcgraph6 \
        libcilkrts5:amd64 \
        libcroco3:amd64 \
        libcups2:amd64 \
        libcupsfilters1:amd64 \
        libcupsimage2:amd64 \
        libcurl3:amd64 \
        libcurl3-gnutls:amd64 \
        libdatrie1:amd64 \
        libdbus-1-3:amd64 \
        libdns-export162 \
        libdns162:amd64 \
        libdpkg-perl \
        libdrm-amdgpu1:amd64 \
        libdrm-common \
        libdrm-intel1:amd64 \
        libdrm-nouveau2:amd64 \
        libdrm-radeon1:amd64 \
        libdrm2:amd64 \
        libedit2:amd64 \
        libelf1:amd64 \
        libencode-locale-perl \
        libexpat1:amd64 \
        libfakeroot:amd64 \
        libffi6:amd64 \
        libfile-basedir-perl \
        libfile-desktopentry-perl \
        libfile-fcntllock-perl \
        libfile-homedir-perl \
        libfile-listing-perl \
        libfile-mimeinfo-perl \
        libfile-stripnondeterminism-perl \
        libfile-which-perl \
        libfont-afm-perl \
        libfontconfig1:amd64 \
        libfontenc1:amd64 \
        libfreetype6:amd64 \
        libgcc-5-dev:amd64 \
	libgcrypt11-dev \
        libgd3:amd64 \
        libgdbm3:amd64 \
        libgdk-pixbuf2.0-0:amd64 \
        libgdk-pixbuf2.0-common \
        libgeoip1:amd64 \
        libgettextpo-dev:amd64 \
        libgettextpo0:amd64 \
        libgirepository-1.0-1:amd64 \
        libgl1-mesa-dri:amd64 \
        libgl1-mesa-glx:amd64 \
        libglapi-mesa:amd64 \
        libglib2.0-0:amd64 \
	libglib2.0-dev \
        libgmp10:amd64 \
        libgnutls30:amd64 \
	libgnutls-dev \
        libgomp1:amd64 \
        libgpgme11:amd64 \
        libgpgme11-dev \
	libgraphite2-3:amd64 \
        libgs9:amd64 \
        libgs9-common \
        libgssapi-krb5-2:amd64 \
        libgssapi3-heimdal:amd64 \
        libgtk2.0-0:amd64 \
        libgtk2.0-bin \
        libgtk2.0-common \
        libgtksourceview2.0-0 \
        libgtksourceview2.0-common \
        libgvc6 \
        libgvpr2 \
        libharfbuzz-icu0:amd64 \
        libharfbuzz0b:amd64 \
        libhcrypto4-heimdal:amd64 \
        libheimbase1-heimdal:amd64 \
        libheimntlm0-heimdal:amd64 \
        libhiredis0.13:amd64 \
        libhogweed4:amd64 \
        libhtml-form-perl \
        libhtml-format-perl \
        libhtml-parser-perl \
        libhtml-tagset-perl \
        libhtml-tree-perl \
        libhttp-cookies-perl \
        libhttp-daemon-perl \
        libhttp-date-perl \
        libhttp-message-perl \
        libhttp-negotiate-perl \
        libhx509-5-heimdal:amd64 \
        libice6:amd64 \
        libicu55:amd64 \
        libidn11:amd64 \
        libijs-0.35:amd64 \
        libio-html-perl \
        libio-socket-ssl-perl \
        libipc-system-simple-perl \
        libisc-export160 \
        libisc160:amd64 \
        libisccc140:amd64 \
        libisccfg140:amd64 \
        libisl15:amd64 \
        libitm1:amd64 \
        libjbig0:amd64 \
        libjbig2dec0 \
        libjemalloc1 \
        libjpeg-turbo8:amd64 \
        libjpeg8:amd64 \
        libjs-jquery \
        libk5crypto3:amd64 \
        libkeyutils1:amd64 \
        libkpathsea6:amd64 \
        libkrb5-26-heimdal:amd64 \
        libkrb5-3:amd64 \
        libkrb5support0:amd64 \
        libksba8:amd64 \
        liblcms2-2:amd64 \
        libldap-2.4-2:amd64 \
        libldb1:amd64 \
        liblinear3:amd64 \
        libllvm6.0:amd64 \
        liblsan0:amd64 \
        libltdl7:amd64 \
        liblua5.2-0:amd64 \
        liblwp-mediatypes-perl \
        liblwp-protocol-https-perl \
        liblwres141:amd64 \
        liblzo2-2:amd64 \
        libmagic1:amd64 \
        libmail-sendmail-perl \
        libmailtools-perl \
        libmicrohttpd10 \
        libmnl0:amd64 \
        libmpc3:amd64 \
        libmpdec2:amd64 \
        libmpfr4:amd64 \
        libmpx0:amd64 \
        libnet-dbus-perl \
        libnet-http-perl \
        libnet-smtp-ssl-perl \
        libnet-ssleay-perl \
        libnettle6:amd64 \
        libnpth0:amd64 \
        libnspr4:amd64 \
        libnss3:amd64 \
        libnss3-nssdb \
        libopts25:amd64 \
        libp11-kit0:amd64 \
        libpango-1.0-0:amd64 \
        libpangocairo-1.0-0:amd64 \
        libpangoft2-1.0-0:amd64 \
        libpaper-utils \
        libpaper1:amd64 \
        libpathplan4 \
        libpcap0.8:amd64 \
        libpci3:amd64 \
        libpciaccess0:amd64 \
        libperl5.22:amd64 \
        libpipeline1:amd64 \
        libpixman-1-0:amd64 \
        libpng12-0:amd64 \
        libpoppler58:amd64 \
        libpopt0:amd64 \
        libpotrace0 \
        libptexenc1:amd64 \
        libpython-stdlib:amd64 \
        libpython2.7:amd64 \
        libpython2.7-minimal:amd64 \
        libpython2.7-stdlib:amd64 \
        libpython3-stdlib:amd64 \
        libpython3.5-minimal:amd64 \
        libpython3.5-stdlib:amd64 \
        libquadmath0:amd64 \
        libroken18-heimdal:amd64 \
        librpm3 \
        librpmbuild3 \
        librpmio3 \
        librpmsign3 \
        librtmp1:amd64 \
        libruby2.3:amd64 \
        libsasl2-2:amd64 \
        libsasl2-modules:amd64 \
        libsasl2-modules-db:amd64 \
        libsensors4:amd64 \
        libserf-1-1:amd64 \
        libsm6:amd64 \
        libsmbclient:amd64 \
        libsnmp-base \
        libsnmp30:amd64 \
        libsqlite3-0:amd64 \
	libsqlite3-dev \
        libssh-4:amd64 \
        libssl1.0.0:amd64 \
        libstdc++-5-dev:amd64 \
        libsvn1:amd64 \
        libsynctex1:amd64 \
        libsys-hostname-long-perl \
        libtalloc2:amd64 \
        libtasn1-6:amd64 \
        libtcl8.6:amd64 \
        libtdb1:amd64 \
        libtevent0:amd64 \
        libtexlua52:amd64 \
        libtexluajit2:amd64 \
        libtext-iconv-perl \
        libthai-data \
        libthai0:amd64 \
        libtie-ixhash-perl \
        libtiff5:amd64 \
        libtimedate-perl \
        libtk8.6:amd64 \
        libtsan0:amd64 \
        libtxc-dxtn-s2tc0:amd64 \
        libubsan0:amd64 \
        libunistring0:amd64 \
        liburi-perl \
        libutempter0:amd64 \
        libvpx3:amd64 \
        libwbclient0:amd64 \
        libwhisker2-perl \
        libwind0-heimdal:amd64 \
        libwrap0:amd64 \
        libwww-perl \
        libwww-robotrules-perl \
        libx11-6:amd64 \
        libx11-data \
        libx11-protocol-perl \
        libx11-xcb1:amd64 \
        libxau6:amd64 \
        libxaw7:amd64 \
        libxcb-dri2-0:amd64 \
        libxcb-dri3-0:amd64 \
        libxcb-glx0:amd64 \
        libxcb-present0:amd64 \
        libxcb-render0:amd64 \
        libxcb-shape0:amd64 \
        libxcb-shm0:amd64 \
        libxcb-sync1:amd64 \
        libxcb1:amd64 \
        libxcomposite1:amd64 \
        libxcursor1:amd64 \
        libxdamage1:amd64 \
        libxdmcp6:amd64 \
        libxext6:amd64 \
        libxfixes3:amd64 \
        libxft2:amd64 \
        libxi6:amd64 \
        libxinerama1:amd64 \
        libxml-parser-perl \
        libxml-twig-perl \
        libxml-xpathengine-perl \
	libmicrohttpd-dev \
	libxml2-dev \
	libxslt-dev \
        libxml2:amd64 \
        libxmu6:amd64 \
        libxmuu1:amd64 \
        libxpm4:amd64 \
        libxrandr2:amd64 \
        libxrender1:amd64 \
        libxshmfence1:amd64 \
        libxslt1.1:amd64 \
        libxss1:amd64 \
        libxt6:amd64 \
        libxtables11:amd64 \
        libxtst6:amd64 \
        libxv1:amd64 \
        libxxf86dga1:amd64 \
        libxxf86vm1:amd64 \
        libyaml-0-2:amd64 \
        libyaml-tiny-perl \
        libzzip-0-13:amd64 \
        linux-libc-dev:amd64 \
        lmodern \
        lua-lpeg:amd64 \
        make \
        man-db \
        manpages \
        manpages-dev \
        mime-support \
        ndiff \
        net-tools \
        netbase \
        nikto \
        nmap \
        nsis \
        nsis-common \
        openssh-client \
        openssl \
        patch \
        perl \
        perl-modules-5.22 \
        pinentry-curses \
        po-debconf \
        poppler-data \
        postfix \
        postgresql \
	libpq-dev \
	pkg-config \
	postgresql-server-dev-all \
	postgresql-client \
	postgresql-contrib \
	preview-latex-style \
        prosper \
        ps2eps \
        python \
        python-beautifulsoup \
        python-bs4 \
        python-cairo \
        python-cffi-backend \
        python-chardet \
        python-crypto \
        python-cryptography \
        python-defusedxml \
        python-enum34 \
        python-gi \
        python-gobject \
        python-gobject-2 \
        python-gtk2 \
        python-gtksourceview2 \
        python-html5lib \
        python-idna \
        python-ipaddress \
        python-ldb \
        python-lxml \
        python-minimal \
        python-ndg-httpsclient \
        python-openssl \
        python-pkg-resources \
        python-pyasn1 \
        python-pypdf \
        python-pysqlite2 \
        python-requests \
        python-samba \
        python-scapy \
        python-simplejson \
        python-six \
        python-soappy \
        python-svn \
        python-talloc \
        python-tdb \
        python-urllib3 \
        python-wstools \
        python2.7 \
        python2.7-minimal \
        python3 \
        python3-minimal \
        python3.5 \
        python3.5-minimal \
        rake \
        redis-server \
        redis-tools \
        rename \
        rpm \
        rpm-common \
        rpm2cpio \
        rsync \
        ruby \
        ruby-did-you-mean \
        ruby-minitest \
        ruby-net-telnet \
        ruby-power-assert \
        ruby-test-unit \
        ruby2.3 \
        rubygems-integration \
        samba-common \
        samba-common-bin \
        samba-libs:amd64 \
        sgml-base \
        shared-mime-info \
        smbclient \
        socat \
        sshpass \
        ssl-cert \
        t1utils \
        tcl \
        tcl8.6 \
        tcpd \
        tex-common \
        tex-gyre \
        texlive-base \
        texlive-binaries \
        texlive-extra-utils \
        texlive-font-utils \
        texlive-fonts-recommended \
        texlive-fonts-recommended-doc \
        texlive-generic-recommended \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-pictures \
        texlive-pstricks \
        tipa \
        tk \
        tk8.6 \
        tzdata \
        ucf \
        unzip \
        w3af \
        w3af-console \
        wapiti \
        wget \
        x11-common \
        x11-utils \
        x11-xserver-utils \
        xauth \
        xbitmaps \
        xdg-utils \
        xml-core \
        xsltproc \
        xterm \
        xz-utils \
        zip \
    -yq --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/Arachni/arachni/releases/download/v1.5.1/arachni-1.5.1-0.5.12-linux-x86_64.tar.gz && \
    tar -zxf arachni-1.5.1-0.5.12-linux-x86_64.tar.gz && \
    mv arachni-1.5.1-0.5.12 /opt/arachni && \
    ln -s /opt/arachni/bin/* /usr/local/bin/ && \
    rm -rf arachni*

# Install openvas libraries
RUN mkdir -p /usr/local/src/openvas && \
	cd /usr/local/src/openvas && \
	wget -nv https://github.com/greenbone/gvm-libs/archive/v9.0.3.tar.gz -O library.tar.gz && \
	tar -zxf library.tar.gz && \
	cd gvm-libs-* && \
	mkdir build && cd build && \
	cmake -DLOCALSTATEDIR=/var -DSYSCONFDIR=/etc -DLIBDIR=/usr/lib/x86_64-linux-gnu -DINCLUDEDIR=/usr/include/x86_64-linux-gnu .. && \
	make && make install && make rebuild_cache

# Install openvas manager
RUN cd /usr/local/src/openvas && \
    wget -nv https://github.com/greenbone/gvmd/archive/v7.0.3.tar.gz -O manager.tar.gz && \
    tar -zxf manager.tar.gz && \
    cd gvmd-* && \
    mkdir build && cd build && \
    cmake -DLOCALSTATEDIR=/var -DSYSCONFDIR=/etc -DBACKEND=POSTGRESQL .. && \
    make && make install && make rebuild_cache

# Install openvas scanner
RUN cd /usr/local/src/openvas && \
    wget -nv https://github.com/greenbone/openvas-scanner/archive/v5.1.3.tar.gz -O scanner.tar.gz && \
    tar -zxf scanner.tar.gz && \
    cd openvas-* && \
    mkdir build && cd build && \
    cmake -DLOCALSTATEDIR=/var -DSYSCONFDIR=/etc .. && \
    make && make install && make rebuild_cache

# Install openvas GSA web
RUN cd /usr/local/src/openvas && \
    wget -nv https://github.com/greenbone/gsa/archive/v7.0.3.tar.gz -O gsa.tar.gz && \
    tar -zxf gsa.tar.gz && \
    cd gsa-* && \
    mkdir build && cd build && \
    sed -i 's/^add_subdirectory/#&/' ../src/CMakeLists.txt && \
    cmake -DLOCALSTATEDIR=/var -DSYSCONFDIR=/etc .. && \
    make && make install && make rebuild_cache

RUN mkdir -p /var/run/redis && \
    mkdir -p /usr/local/var/lib/openvas/openvasmd/gnupg && \
    mkdir -p /var/log/openvas && \
    mkdir -p /openvas
    mkdir -p /usr/local/share/openvas/gsa/locale

COPY --chown=redis:redis config/redis.config /etc/redis/redis.conf
COPY bin/setup.sh /openvas/setup.sh
RUN chmod 700 /openvas/setup.sh && \
	bash /openvas/setup.sh

RUN apt-get clean -yq && \
	apt-get autoremove -yq && \
	apt-get purge -y --auto-remove build-essential cmake

RUN rm -rf /usr/local/src/openvas

COPY bin/start.sh /openvas/start.sh
RUN chmod 700 /openvas/start.sh

CMD ["/bin/bash", "/openvas/start.sh"]

EXPOSE 443 9390

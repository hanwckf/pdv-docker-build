FROM alpine:3.12

MAINTAINER hanwckf <hanwckf@vip.qq.com>

ARG APK_MIRROR_URL
RUN if test -n "$APK_MIRROR_URL"; then \
	sed -i "s#dl-cdn.alpinelinux.org#$APK_MIRROR_URL#" \
	/etc/apk/repositories; fi

RUN apk update && \
	apk add make gcc g++ cpio curl wget nano xxd \
		pkgconfig rpcgen fakeroot ncurses bash patch \
		bsd-compat-headers python2 python3 zlib-dev \
		automake gettext gettext-dev autoconf bison \
		flex coreutils cmake git libtool gawk sudo && \
	rm -rf /var/cache/apk/*

# See https://github.com/hanwckf/padavan-toolchain/releases
ADD mipsel-linux-uclibc.tar.xz /opt/rt-n56u/toolchain-mipsel/toolchain-3.4.x


[![Docker Stars](https://img.shields.io/docker/stars/yunsur/alpine-snell.svg?style=flat-square)](https://hub.docker.com/r/yunsur/alpine-snell/)
[![Docker Pulls](https://img.shields.io/docker/pulls/yunsur/alpine-snell.svg?style=flat-square)](https://hub.docker.com/r/yunsur/alpine-snell/)


Snell Docker image
=================================

This image is based on Alpine Linux image, which is only a 10MB image, and contains
[Snell](https://github.com/surge-networks/snell/) packaged by surge-networks.

Download size of this image is only:

[![](https://images.microbadger.com/badges/image/yunsur/alpine-snell.svg)](http://microbadger.com/images/yunsur/alpine-snell "Get your own image badge on microbadger.com")

NOTE: snell repositories contain only Glibc linked packaged binaries for Linux, so we have to use [glibc workaround](https://github.com/gliderlabs/docker-alpine/issues/11) on Alpine.

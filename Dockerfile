# This is a comment
FROM ubuntu:14.04
MAINTAINER Miguel Escalante <miguel@opi.la>
RUN apt-get update \
&& apt-get install -y build-essential \
libpq-dev \
liblapack3 \
libblas3 \
libmysql++-dev \
sqlite3 \
fort77 \
gnuplot-x11 \
gfortran \
texinfo \
liblapack-dev \
\liblapack3gf \
texi2html \
libglpk-dev \
libgeos-dev \
libgdal1-dev \
libproj-dev \
wget \
git \
curl\
&& apt-get build-dep -y r-base
ADD http://cran.r-project.org/src/base/R-latest.tar.gz R-latest.tar.gz 
RUN mkdir -p /usr/src/R \
&& tar -xzvf R-latest.tar.gz -C /usr/src/R \
&& "$(ls -dt /usr/src/R/R-*/ | head -1 )"/configure --enable-memory-profiling --enable-R-shlib --with-blas --with-lapack --with-system-zlib --with-system-bzlib --with-system-xz --with-tcltk  --with-cairo --with-libpng --with-jpeglib --with-libtiff && cd "$(ls -dt /usr/src/R/R-*/ | head -1 )" && make install && cd -

FROM python
# image based on python/debian

RUN apt-get update
RUN apt-get install -y wget cmake vim git
RUN pip install numpy

RUN mkdir /tmp/eccodes
WORKDIR /tmp/eccodes
# get Eccodes Version 2.12 with interface for python3 (beta)
RUN wget https://confluence.ecmwf.int/download/attachments/45757960/eccodes-2.12.0-Source.tar.gz -O /tmp/eccodes/eccodes2.tar.gz
RUN tar -C /tmp/eccodes -xzvf /tmp/eccodes/eccodes2.tar.gz
RUN mkdir /tmp/eccodes/build
WORKDIR /tmp/eccodes/build
RUN cmake -DENABLE_FORTRAN=OFF /tmp/eccodes/eccodes-2.12.0-Source
RUN make
RUN make install

# get example for pyhton3 and EcCodes from https://github.com/cumulant/eccodes_py3
RUN mkdir /dockerwork
WORKDIR /dockerwork
RUN git clone https://github.com/cumulant/eccodes_py3

# cleanup
RUN rm -R /tmp/eccodes

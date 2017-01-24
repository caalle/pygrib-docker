FROM python:2.7.13

RUN apt-get update && apt-get install -y \
  gcc \
  gfortran \
  g++ \
  build-essential \
  libgrib-api-dev

RUN git clone https://github.com/jswhit/pygrib.git pygrib
COPY setup.cfg ./pygrib/setup.cfg
RUN pip install numpy pyproj

RUN cd pygrib && python setup.py build && python setup.py install

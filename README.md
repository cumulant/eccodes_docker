# eccodes_docker

The dockerfile is used to build an image including Eccodes with python3 Interface 
and an test example python script from https://github.com/cumulant/eccodes_py3
which reads a GRIB from the numerical weather prediction model ICON.

First steps:
- Build a docker image with this docker file:

docker build -t eccodes_python3 .

- Start a container with an image build with this dockerfile:

docker run -i -t eccodes_python3

- Execute Python Script in a docker container:

docker exec <container_id> /bin/bash -c "cd eccodes_py3; python grib_read.py"

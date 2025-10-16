[TOC]
# Docker command

View running containors:

```shell
docker ps
```

View all containors:

```shell
docker ps -a
```

List all images:

```shell
docker images
```

Stop running containor:

```shell
docker stop <CONTAINER ID>
```

Stop all running containors:

```shell
docker rm $(docker ps -a -q)
```

Commit containor into image:

```shell
docker commit <CONTAINER ID> <Image Name>
```

Download [manylinux1](https://quay.io/repository/pypa/manylinux1_x86_64?tag=latest&tab=tags) image:

```shell
docker pull quay.io/pypa/manylinux1_x86_64:latest
```
Running docker image into terminal:

```shell
docker run -it --rm -e PLAT=manylinux1_x86_64 -v `pwd`:/io quay.io/pypa/manylinux1_x86_64 /bin/bash
```

|Option|Illustration|
|-|-|
|-it|Creating an interactive bash shell in the container|
|--rm|Automatically remove the container when it exits|
|-v \`pwd\`:/io|Map current host directory into Docker directory:/io/ |
|quay.io/pypa/manylinux1_x86_64|Docker image name|
|/bin/bash|Run into bash, allow terminal conversation|
|PLAT=manylinux1_x86_64|Define $PLAT variable|

# Example on compile manylinux pandas

1. Download pandas 0.24.2 source code [here](https://files.pythonhosted.org/packages/b2/4c/b6f966ac91c5670ba4ef0b0b5613b5379e3c7abdfad4e7b89a87d73bae13/pandas-0.24.2.tar.gz).

2. Run docker manylinux_x86_84 image

```shell
docker run -it --rm -e PLAT=manylinux1_x86_64 -v `pwd`:/io quay.io/pypa/manylinux1_x86_64 /bin/bash
```

3. Move file and unzip

```shell
cp /io/pandas-0.24.2.tar.gz /home/
cd home
tar -zxvf pandas-0.24.2.tar.gz
```

4. Use narrow-unicode python 2.7.x to create wheel

```shell
cd pandas-0.24.2
/opt/python/cp27-cp27m/bin/python setup.py bdist_wheel
```

5. Repair the wheel file and output to host directory

```shell
auditwheel repair dist/pandas-0.24.2-cp27-cp27m-linux_x86_64.whl --plat manylinux1_x86_64 -w /io/
```

# C extension with python
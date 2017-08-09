Docker container for Developing Box of Raspberry Pi
====

How to build
----
just:

```
./build.sh
```

How to run
---
for example:

```bash
### normal
docker run --rm -it --privileged ubuntu-16.04-rpi-dev-box
### recommended: share local ./workspace directory
docker run --rm -it --privileged -v `pwd`/workspace:/root/workspace ubuntu-16.04-rpi-dev-box
```

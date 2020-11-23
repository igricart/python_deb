from ubuntu:18.04

RUN apt update && apt install -y \
	python3-all \
	build-essential \
	debhelper \
	debmake

# Needs to run DEBMAIL and DEB
ENV DEBEMAIL="imr@blue-ocean-robotics.com"
ENV DEBFULLNAME="Ignacio Ricart"

# dpkg-buildpackage -b -uc -us
ADD . /home/test-0.1.0
RUN cd /home/test-0.1.0 && debmake -n -b':py3'

# Move back one folder

# TODO:Change `Section` from `unknown` to `develop`
# Add script to debian folder
# Make deb package
RUN cd /home/test-0.1.0 && debuild
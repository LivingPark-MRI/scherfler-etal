# Use Fedora 34 so that Octave 5.2.0 is installed.
# In later versions, https://savannah.gnu.org/bugs/?61843 crashes DARTEL.
# Thanks Guillaume!
from fedora:34

# Update system and install required packages
RUN dnf update -y && dnf install -y make octave octave-devel patch redhat-rpm-config tar wget xorg-x11-server-Xvfb

# Download, patch and compile SPM
# Adapted from https://en.wikibooks.org/wiki/SPM/Octave
RUN wget https://github.com/spm/spm12/archive/refs/tags/r7771.tar.gz && tar zxvf r7771.tar.gz &&\
    wget https://raw.githubusercontent.com/spm/spm-docker/main/octave/spm12_r7771.patch && patch -p3 -d spm12-r7771 < spm12_r7771.patch &&\
    (cd /spm12-r7771/src && make PLATFORM=octave && make PLATFORM=octave install)

# Cleanup and add SPM to Octave path
RUN rm /r7771.tar.gz && octave --eval 'addpath("/spm12-r7771") ; savepath()'
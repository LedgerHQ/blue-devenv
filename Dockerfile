#*******************************************************************************
#   Ledger Blue - Misc 
#   (c) 2016 Ledger
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#*******************************************************************************


FROM        ubuntu:bionic
MAINTAINER  Ledger Firmware Team <hello@ledger.fr>

RUN apt-get update && apt-get -y install cmake git build-essential vim wget libc6-i386 libc6-dev-i386 libusb-1.0-0-dev libudev-dev python python-dev python-pip python3.6 python3.6-dev python3-pip

RUN mkdir /opt/ledger

RUN cd /opt/ledger && wget -O - https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 | tar xjvf -

RUN cd /opt/ledger && wget -O - http://releases.llvm.org/7.0.1/clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-14.04.tar.xz | tar xJvf - && mv clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-14.04 clang-arm-fropi

ENV PATH /opt/ledger/clang-arm-fropi/bin:/opt/ledger/gcc-arm-none-eabi-8-2018-q4-major/bin:$PATH
ENV BOLOS_ENV /opt/ledger

RUN pip3 install ledgerblue

RUN pip install ledgerblue Pillow

RUN echo "rm -rf bin/ debug/ dep/ obj/ app.hex src/glyphs.c src/glyphs.h && make BOLOS_ENV=/opt/ledger/ BOLOS_SDK=/home/blue-secure-sdk" >> ~/.bash_history
RUN echo "rm -rf bin/ debug/ dep/ obj/ app.hex src/glyphs.c src/glyphs.h && make BOLOS_ENV=/opt/ledger/ BOLOS_SDK=/home/ledger/sdk-nanox-1.2.4-1.3" >> ~/.bash_history
RUN echo "rm -rf bin/ debug/ dep/ obj/ app.hex src/glyphs.c src/glyphs.h && make BOLOS_ENV=/opt/ledger/ BOLOS_SDK=/home/nanos-secure-sdk" >> ~/.bash_history

CMD cd /home && git clone --branch nanos-1552 https://github.com/LedgerHQ/nanos-secure-sdk.git && git clone --branch blue-r21.1 https://github.com/LedgerHQ/blue-secure-sdk.git && bash

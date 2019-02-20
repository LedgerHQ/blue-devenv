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


FROM        ubuntu:trusty
MAINTAINER  Ledger Firmware Team <hello@ledger.fr>

RUN apt-get update && apt-get -y install cmake git build-essential vim python wget libc6-i386 libc6-dev-i386

RUN mkdir /opt/ledger-blue

RUN cd /opt/ledger-blue && wget -O - https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2 | tar xjvf -

RUN cd /opt/ledger-blue && wget -O - http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz | tar xJvf - && mv clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04 clang-arm-fropi

ENV PATH /opt/ledger-blue/clang-arm-fropi/bin:/opt/ledger-blue/gcc-arm-none-eabi-5_3-2016q1/bin:$PATH
ENV BOLOS_ENV /opt/ledger-blue

RUN apt-get -y install python-pip python-imaging
RUN pip install Pillow

RUN echo "rm -rf bin/ debug/ dep/ obj/ app.hex && make BOLOS_ENV=/opt/ledger-blue/ BOLOS_SDK=/home/nanos-secure-sdk" > ~/.bash_history

CMD cd /home && git clone --branch nanos-1552 https://github.com/LedgerHQ/nanos-secure-sdk.git && git clone --branch blue-r21.1 https://github.com/LedgerHQ/blue-secure-sdk.git && bash

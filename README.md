:warning: **This repository is deprecated** Use https://ledger.readthedocs.io/en/latest/ for up to date information.

# Ledger Blue development environment

Developping applications for Ledger Blue requires a specific SDK and two compilers

  - A standard ARM gcc to build the non-secure (STM32) firmware and link the secure (ST31) applications
  - A standard ARM clang above 4.0.0 with [ROPI support](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0491i/CHDCDGGG.html) to build the secure (ST31) applications    

## Setting up the environment (Docker)

  - Follower the instructions on https://github.com/LedgerHQ/ledger-dev-doc/blob/0/nanos/setup.rst
  - You have now been able to deploy, run and remove the Hello World application

## Setting up the environment (from scratch)

  - Pick a directory, linking the environment variable BOLOS_ENV to it
  - Download a prebuild gcc from https://launchpad.net/gcc-arm-embedded/+milestone/5-2016-q1-update and unpack it into this directory
  - Download a prebuild clang from http://releases.llvm.org/download.html#4.0.0 and unpack it into this directory, then link this directory to clang-arm-fropi or rename it

## Adding the Nano S SDK

Download the Nano S SDK from https://github.com/ledgerhq/nanos-secure-sdk and link the environment variable BOLOS_SDK to it. You'll have to checkout the tag matching your firmware version.

## Adding the Blue SDK

Download the Blue SDK from https://github.com/ledgerhq/blue-secure-sdk and link the environment variable BOLOS_SDK to it. You'll have to checkout the tag matching your firmware version.

## Troubleshooting 

If you get missing include files on an x64 linux device, make sure to install the libc6-i386 and libc6-dev-i386 packages

## Contact 

For any question please contact hello@ledger.fr 



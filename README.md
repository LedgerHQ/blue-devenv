# Ledger devices Docker developement environment

This Docker image was made as the fast deployable development environment for all the Ledger devices.

You can run it using `docker run -t -v ~/Documents/ledger:/home/ledger -i tolsi/ledger-devenv`.

Note that you must specify the folder containing the Ledger applications and the private Nano X SDK (if you have it) from the folder on your system (`~/Documents/ledger` in this example) to the docker container (it will be available in `/home/ledger`).

Nano S 1.5.5.2 and Blue SDK 21.1 are downloaded when docker container starts (to `/home/nanos-secure-sdk` and `/home/blue-secure-sdk` respectively) and Nano X SDK should be in the folder `/home/ledger/sdk-nanox-1.2.4-1.3`.

You can go to the folder of any of the Ledger application and use ready-made commands in bash history in advance to build the application for the corresponding device. To do this, just press the up key several times while in the console and then press Enter.

## Contact 

For any question please create an issue in this repo

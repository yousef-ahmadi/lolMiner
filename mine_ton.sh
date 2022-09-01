#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=https://server1.whalestonpool.com
WALLET=UQBUkIjOBpy4qayoN21C9WbL_XFjQDHsynFFqR0C2-3wjsnl

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo TON --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo SHA256 --pool $POOL --user $WALLET $@
done

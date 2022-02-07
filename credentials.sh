#!/bin/bash

command="aws configure"

expect -c "
spawn ${command}
expect \"AWS Access Key ID\"
send \"xxxxxxxxx\n\"
expect \"AWS Secret Access Key\"
send \"xxxxxxxxxxxxxxxxxxxxxxx\n\"
expect \"Default region name\"
send \"ap-northeast-1\n\"
expect \"Default output format\"
send \"\n\"
expect \"#\"
exit 0
"


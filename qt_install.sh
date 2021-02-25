#!/bin/bash
check=`cat /root/.bash_history|grep '#'|wc -l`
download_file()
{
    echo "----------Download file----------"
    wget -P /tmp/ http://10.241.24.220/soft/titan_agent/App_Linux.tar.gz
    wget -P /tmp/ http://10.241.24.220/soft/titan_agent/install_agent.sh
}

install_agent()
{
    echo "----------Install agent----------"
    bash /tmp/install_agent.sh offinstall
}

delete_file()
{
    echo "----------Delete file----------"
    rm -rf /tmp/App_Linux.tar.gz
    rm -rf /tmp/install_agent.sh
}
delete_file
download_file
if [ ${check} -eq 0 ]
then
    install_agent
else
    echo "">/root/.bash_history
    install_agent
fi
delete_file


#!/bin/bash

LIST="52 53 54 58"
for i in $LIST; do
	ssh root@172.17.2.$i '

if [[ $i == 52 ]]; then

	yum -y remove cloudera-manager-agent
	yum -y remove hadoop-hdfs-namenode
	echo "Removed NN"

fi

if [[ $i == 53 ]]; then

        yum -y remove cloudera-manager-agent
        yum -y remove hadoop-client
	yum -y remove hadoop-0.20-mapreduce-tasktracker
	yum -y remove hadoop-0.20-mapreduce-jobtracker
echo "Removed JT-DN1"

fi
if [[ $i == 54 ]]; then

        yum -y remove cloudera-manager-agent
        yum -y remove cloudera-manager-server
	yum -y remove hadoop-hdfs-secondarynamenode

echo "removed SNN"

fi
if [[ $i == 58 ]]; then

        yum -y remove cloudera-manager-agent
        yum -y remove hadoop-client
        yum -y remove hadoop-0.20-mapreduce-tasktracker
echo "Removed DN2"

fi
'
done

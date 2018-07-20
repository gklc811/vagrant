#!/bin/bash



function print_green {
	  echo -e "\e[32m${1}\e[0m"
  }

  print_green 'Clean Yum'
  yum clean all
  rm -rf /var/cache/yum

  print_green 'Cleanup bash history'
  unset HISTFILE
  [ -f /root/.bash_history ] && rm /root/.bash_history
  [ -f /home/vagrant/.bash_history ] && rm /home/vagrant/.bash_history
   
  print_green 'Cleanup log files'
  find /var/log -type f -exec truncate -s0 {} \;
   
  print_green 'Whiteout root'
  count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`
  let count--
  dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count
  rm /tmp/whitespace

  
  print_green 'Zero out disk'
  dd if=/dev/zero of=/EMPTY bs=1M
  rm -f /EMPTY

  print_green 'Vagrant cleanup complete!'

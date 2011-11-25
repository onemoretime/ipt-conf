#!/bin/bash
#  IPT-CONF small configuration framework to handle configuration of linux iptables netfilter.
#  Copyright (C) 2011 Robert Vojcik
#  
#  This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#  
#  Contact
#  -------
#  Robert Vojcik ( vojcik@gmail.com )

. /etc/ipt.conf

echo "Starting firewall"

if [ -e $CONFDIR/firewall.conf ] ; then 

. $CONFDIR/firewall.conf


for rule in $CONFDIR/rules.enabled/*.rule ; do 
	echo -n "Adding $rule"
	. $rule && echo "[OK]" || echo "[ERROR]"
done


else
	echo "Conf file not found... exiting"
	exit 1
fi

echo "Done"

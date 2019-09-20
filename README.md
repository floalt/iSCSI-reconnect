# iscsi-reconnect
Reconnect Microsoft iSCSI when failure

## Description
For Microsoft Windows Server

If an iSCSI Connection fails, eg. after a Server Reboot, this script can reconnect the iSCSI Target.

It checks, if the Target ist connect correctly.<br>
If not: restart iSCSI service and connect target

## Usage
Set Parameters in the script:<br>
$suche: name of the local server to find all iSCSI-volumes<br>
$iqn: the iqn of the iSCSI Target to be connected

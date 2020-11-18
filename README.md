# iSCSI-reconnect
Reconnect Microsoft iSCSI when failure

## Description
For Microsoft Windows Server

If an iSCSI Connection fails, eg. after a Server Reboot, this script can reconnect the iSCSI Target.

It checks, if the Target ist connect correctly.<br>
If not: restart iSCSI service and connect target

----

## Usage
Set Parameters in the script:<br>

Type: ''Get-Volume | fl *''<br>
Use ''FileSystemLabel'' for ''label''<br>

Type: ''Get-IscsiSession''<br>
Use ''TargetNodeAddress'' for ''iqn''<br>

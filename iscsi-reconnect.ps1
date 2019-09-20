# reconnect iSCSI-Targets
# author: flo.alt@fa-netz.de
# Ver 0.8

## Set parameters

param(
$suche = "SERV12*";
$iqn = "iqn.2004-08.jp.buffalo.8857eeb84e6e.dc-backup"
)

## check if iSCSI Volume is connected

$lookiscsi=Get-Volume | where {$_.FileSystemLabel -like $suche} | ft FileSystemLabel -HideTableHeaders

## do something

if($lookiscsi -ne $null) {
    echo "iSCSI vorhanden, es gibt nichts zu tun"
    }
else {
    echo "iSCSI Target has to be reconnected"
    Disconnect-IscsiTarget -NodeAddress $iqn -Confirm:$false
    echo "iSCSI Target disconnected"
    Connect-IscsiTarget -NodeAddress $iqn
    echo "iSCSI Target connected"
    }

# iSCSI-Targets neu verbinden
# author: flo.alt@fa-netz.de
# Ver 0.81

## Parameter konfigurieren

param(
$suche = "SERV12*",
$iqn = "iqn.2004-08.jp.buffalo.8857eeb84e6e.dc-backup"
)

## Abfragen, ob iSCSI Volume verbunden ist

$lookiscsi=Get-Volume | where {$_.FileSystemLabel -like $suche} | ft FileSystemLabel -HideTableHeaders

## Maßnahme ergreifen

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

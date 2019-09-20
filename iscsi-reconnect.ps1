# iSCSI-Targets neu verbinden
# author: flo.alt@fa-netz.de
# Ver 0.8

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
    echo "iSCSI muss neu verbunden werden"
    # Bestehende iSCSI-Verbindungen trennen
    $Target = Get-IscsiTarget
    Disconnect-IscsiTarget -NodeAddress $Target.NodeAddress -Confirm:$false
    echo "bestehende Verbindung getrennt"
    # iSCSI-Target neu verbinden
    Connect-IscsiTarget -NodeAddress $iqn
    echo "Verbindung neu hergestellt"
    }
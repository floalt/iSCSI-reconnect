<#
reconnect iSCSI-Targets
author: flo.alt@fa-netz.de
Ver 0.8.1


To find values for these parameters

Type: 'Get-Volume | fl *'
Use 'FileSystemLabel' for 'label'

Type: 'Get-IscsiSession'
Use 'TargetNodeAddress' for 'iqn'

#>



## Set parameters

$iscsivol = @(
    @{label = 'serv-ap*';iqn = 'iqn.2004-08.jp.buffalo.106f3f1711ba.app-backup'}
    @{label = 'o365-backup';iqn = 'iqn.2004-08.jp.buffalo.106f3fcf0c40.o365-backup'}
)


## Script


foreach($vol in $iscsivol) {
    
    # check if iSCSI Volume is connected
    $lookiscsi=Get-Volume | where {$_.FileSystemLabel -like $vol.label} | ft FileSystemLabel -HideTableHeaders

    if($lookiscsi -ne $null) {
    $label = $vol.label
        echo "OK: iSCSI $label is connected. Nothing to do."
    
    } else {
        echo "ERROR: iSCSI $label is not connected."

        # reconnect iSCSI volume
        echo "reconnecting iSCSI target..."
        Disconnect-IscsiTarget -NodeAddress $vol.iqn -Confirm:$false
        echo "iSCSI Target disconnected"
        Connect-IscsiTarget -NodeAddress $vol.iqn
        echo "iSCSI Target connected"
    }
}

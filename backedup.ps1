$subscriptions = Get-AzSubscription

foreach ($sub in $subscriptions) {
    Set-AzContext -SubscriptionId $sub.Id

    $vaults = Get-AzRecoveryServicesVault

    foreach ($vault in $vaults) {
        Set-AzRecoveryServicesVaultContext -Vault $vault

        # Retrieve replicated items
        $replicatedItems = Get-AzRecoveryServicesAsrReplicationProtectedItem

        # Retrieve backed-up items
        $backupItems = Get-AzRecoveryServicesBackupItem
    }
}

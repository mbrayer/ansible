import-module hyper-v
$PC = "kassad"
$VMNET = "Interne"
$VHD = "c:\VM\$PC\HDD1.vhdx"
# Création de la VM avec son disque dur
new-VM -name $PC -MemoryStartupBytes 512MB -NewVHDPath $VHD -NewVHDSizeBytes 5GB
# Suppression des connexions réseaux
Remove-VMNetworkAdapter -VMName $PC
# Ajout d'une carte réseau héritée
add-vmnetworkadapter $PC -IsLegacy 1
# Connexion au réseau "Interne" pour notre exemple
Connect-VMNetworkAdapter -VMName $PC -SwitchName $VMNET

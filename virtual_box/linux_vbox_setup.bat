ECHO OFF

:: Variables
SET vbox_name=%1
SET wifi_device="Intel(R) Centrino(R) Ultimate-N 6300 AGN"
SET ethernet_device="Intel(R) Ethernet Connection I217-LM"
SET iso_file="%HOMEPATH%\VirtualBox VMs\ubuntu-14.04.3-desktop-amd64.iso"
SET vdi_file="%HOMEPATH%\VirtualBox VMs\%vbox_name%\%vbox_name%.vdi"
SET shared_folder_name=VM_Shared_Folder
SET shared_folder="C:%HOMEPATH%\Desktop\%shared_folder_name%"
SET ram=11350
SET mem=102400

:: Virtual Box Setup
VBoxManage createvm --name %vbox_name% --register
VBoxManage modifyvm %vbox_name% --ioapic on
VBoxManage modifyvm %vbox_name% --audio dsound
VBoxManage modifyvm %vbox_name% --audiocontroller ac97
VBoxManage modifyvm %vbox_name% --ostype Ubuntu_64
VBoxManage modifyvm %vbox_name% --vram 20
VBoxManage modifyvm %vbox_name% --memory %ram%

:: Create .vdi file
VBoxManage createhd --filename %vdi_file% --size %mem% --variant Standard

:: Setup IDE and SATA
VBoxManage storagectl %vbox_name%  --name "IDE" --add ide
VBoxManage storageattach %vbox_name% --storagectl "IDE" --port 0 --device 0 --type dvddrive --medium %iso_file%
VBoxManage storagectl %vbox_name%  --name "SATA" --add sata
VBoxManage storageattach %vbox_name% --storagectl "SATA" --port 0 --device 0 --type hdd --medium %vdi_file%

:: Setup Network Adapter
VBoxManage modifyvm %vbox_name% --nic1 bridged --nicpromisc1 allow-all --bridgeadapter1 %wifi_device% --nic2 bridged --nicpromisc2 allow-all --bridgeadapter2 %ethernet_device%

:: Setup Shared Folder
mkdir %shared_folder%
VBoxManage sharedfolder add %vbox_name% --name %shared_folder_name% --hostpath %shared_folder% --automount

:: Start VM
VBoxManage startvm %vbox_name% --type gui
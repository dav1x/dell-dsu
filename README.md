# dell-dsu

Container image to run FW updates on baremetal Dell servers.

Usage:
```
# podman run --privileged --network=host -it  quay.io/dphillip/dell-dsu:latest
```

Example:
```
[root@master-1 ~]# podman run --privileged --network=host -it  quay.io/dphillip/dell-dsu:latest 
Trying to pull quay.io/dphillip/dell-dsu:latest...
Getting image source signatures
Copying blob a1d0c7532777 done  
Copying blob 4f10935b76ce done  
Copying config ac8a0dbb31 done  
Writing manifest to image destination
Storing signatures
DELL EMC System Update 1.9.2.0
Copyright (C) 2014 -- 2021 DELL EMC Proprietary.
Import Public Key(s)
Importing key 1019CED6 is successful
Importing key 23B66A9D is successful
Importing key 34D8786F is successful
Importing key 46770C59 is successful
Importing key 1019CED6 in rpm is successful
Importing key 23B66A9D in rpm is successful
Importing key 34D8786F in rpm is successful
Importing key 46770C59 in rpm is successful
Verifying catalog installation ...
Installing catalog from repository ...
Fetching dsucatalog ...
Reading the catalog ...
Fetching invcol_DKVCN_LN64_21_09_200_1155_A00 ...
Verifying inventory collector installation
Getting System Inventory ...
Determining Applicable Updates ...
Fetching SAS-RAID_Firmware_700GG_LN_25.5.9.0001_A17 ...
Fetching Network_Firmware_M20T0_LN_20.5.13_A00 ...
Fetching BIOS_T2MKV_LN64_2.12.2 ...
Installing SAS-RAID_Firmware_700GG_LN_25.5.9.0001_A17
Installed successfully
Installing Network_Firmware_M20T0_LN_20.5.13_A00
Installed successfully
Installing BIOS_T2MKV_LN64_2.12.2Installed successfully
Installed successfully
Please reboot the system for successful update(s) to take effect
Done! Please run 'dsu --inventory' to check the inventory
Progress report is available at:/usr/libexec/dell_dup/DSU_STATUS.json
Exiting DSU!
```

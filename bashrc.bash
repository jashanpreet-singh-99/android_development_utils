alias kernel_env="export CROSS_COMPILE=/home/jashan/android/kernel/Utils/aarch64-linux-android-4.9-uber-master/bin/aarch64-linux-andro>

get_config () {
        path=$(ls $(pwd)/arch/arm64/configs)
        count=1
        for f in $path
        do
                if [[ $f == *"_"*"_defconfig" ]]; then 
                        echo [$count] $f
                        ((count++))
                fi
        done
}

flash_stock_yu () {
echo "---------------------[ Start flashing ROM ]-------------------------"
echo "----------------[ Checking for connected devices ]------------------"
sudo $(which fastboot) -i 0x2A96 devices 
echo "----------------------[ Flashing kernel ]---------------------------"
sudo $(which fastboot) -i 0x2A96 flash boot ~/android/stock/boot.img
echo "---------------[ Flashing modem and bootloader ]--------------------"
sudo $(which fastboot) -i 0x2A96 flash aboot ~/android/stock/emmc_appsboot.mbn
sudo $(which fastboot) -i 0x2A96 flash modem ~/android/stock/NON-HLOS.bin
sudo $(which fastboot) -i 0x2A96 flash rpm ~/android/stock/rpm.mbn
sudo $(which fastboot) -i 0x2A96 flash sbl1 ~/android/stock/sbl1.mbn
sudo $(which fastboot) -i 0x2A96 flash tz ~/android/stock/tz.mbn
sudo $(which fastboot) -i 0x2A96 flash hyp ~/android/stock/hyp.mbn
sudo $(which fastboot) -i 0x2A96 flash splash ~/android/stock/splash.img
echo "-------------------[ Flashing cache partition ]---------------------"
sudo $(which fastboot) -i 0x2A96 flash cache ~/android/stock/cache.img
echo "-------------------[ Flashing data partition ]----------------------"
sudo $(which fastboot) -i 0x2A96 flash userdata ~/android/stock/userdata.img
echo "-------------------[ Flashing system partition ]--------------------"
sudo $(which fastboot) -i 0x2A96 flash system ~/android/stock/system.img
echo "----------------------[ Flashing recovery ]-------------------------"
sudo $(which fastboot) -i 0x2A96 flash recovery ~/android/stock/twrp.img
echo "---------------------[ Rebooting device ]---------------------------"
sudo $(which fastboot) -i 0x2A96 reboot
echo "-------------------------[ ALL DONE ]-------------------------------"
}

flash_twrp () {
sudo $(which fastboot) -i 0x2A96 boot ~/android/stock/twrp.img
}


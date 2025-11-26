# repo init
#repo init -u https://github.com/crdroidandroid/android.git -b 16.0 --git-lfs --no-clone-bundle
#repo init -u https://github.com/ProjectMatrixx/android.git -b 16.0 --git-lfs
repo init -u https://github.com/Evolution-X/manifest -b bq1 --git-lfs

# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
device/xiaomi
kernel/xiaomi
vendor/xiaomi
hardware/xiaomi
packages/resources/devicesettings
vendor/lineage-priv/keys
)

rm -rf "${remove[@]}"

# Deivce Trees
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch -b evo device/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common.git -b aosp-16-cleanup device/xiaomi/sm8250-common

# Vendor Trees
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_munch vendor/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common

# Munch Firmware
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware.git vendor/xiaomi/munch-firmware

# Kernel Tree
#git clone https://github.com/crdroidandroid/android_kernel_xiaomi_sm8250.git -b 16.0-munch kernel/xiaomi/sm8250
https://github.com/Khalvat-M/android_kernel_xiaomi_sm8250.git kernel/xiaomi/sm8250

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git -b aosp-16 hardware/xiaomi

# MIUI Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera.git vendor/xiaomi/miuicamera

# devicesettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings.git packages/resources/devicesettings

# My Keys
git clone https://github.com/Olzhas-Kdyr/keys vendor/lineage-priv/keys

#cd kernel/xiaomi/sm8250
#chmod +x ksu.sh
#bash ksu.sh
#rm -rf KernelSU-Next/userspace/su
#cd ../../..

rm -rf build/soong
git clone https://github.com/Olzhas-Kdyr/build_soong.git -b bq1 build/soong 

# Building 
. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
export SKIP_ABI_CHECKS=true
lunch lineage_munch-bp3a-user
m evolution 

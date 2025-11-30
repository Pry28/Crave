# repo init
repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs

#sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
device/xiaomi
kernel/xiaomi
vendor/xiaomi
hardware/xiaomi
packages/true/devicesettings
vendor/lineage-priv/keys
)

rm -rf "${remove[@]}"

# Deivce Trees
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch device/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common.git -b aosp-16-cleanup device/xiaomi/sm8250-common

# Vendor Trees
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_munch vendor/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common

# Munch Firmware
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware.git vendor/xiaomi/munch-firmware

# Kernel Tree
git clone https://github.com/POCO-F4-Development/kernel_xiaomi_sm8250.git -b aosp-16 kernel/xiaomi/sm8250

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git -b aosp-16 hardware/xiaomi

# MIUI Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera.git vendor/xiaomi/miuicamera

# devicesettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings.git packages/resources/devicesettings

# My Keys
git clone https://github.com/Olzhas-Kdyr/keys vendor/lineage-priv/keys

cd kernel/xiaomi/sm8250
chmod +x ksu.sh
bash ksu.sh
rm -rf KernelSU-Next/userspace/su
cd ../../..

rm -rf frameworks/base
git clone https://github.com/Pry28/frameworks_base frameworks/base

rm -rf vendor/lineage
git clone https://github.com/Pry28/vendor_lineage vendor/lineage

rm -rf system/bpf
git clone https://github.com/Pry28/system_bpf system/bpf

# Building 
. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
export SKIP_ABI_CHECKS=true
lunch lineage_munch-bp2a-user
m bacon

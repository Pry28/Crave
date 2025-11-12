# repo init
repo init -u https://github.com/crdroidandroid/android.git -b 16.0 --git-lfs --no-clone-bundle

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
git clone https://github.com/crdroidandroid/android_device_xiaomi_munch.git device/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common.git device/xiaomi/sm8250-common

# Vendor Trees
git clone https://github.com/crdroidandroid/proprietary_vendor_xiaomi_munch -b 16.0 vendor/xiaomi/munch
git clone https://github.com/crdroidandroid/proprietary_vendor_xiaomi_sm8250-common -b 16.0-munch vendor/xiaomi/sm8250-common

# Munch Firmware
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone https://github.com/crdroidandroid/android_kernel_xiaomi_sm8250 -b 16.0-munch kernel/xiaomi/sm8250

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git -b aosp-16 hardware/xiaomi

# MIUI Camera
git clone https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# devicesettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings.git packages/resources/devicesettings

# My Keys
git clone https://github.com/Olzhas-Kdyr/keys vendor/lineage-priv/keys

# Building 
. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
export SKIP_ABI_CHECKS=true
lunch lineage_munch-bp2a-user
m bacon

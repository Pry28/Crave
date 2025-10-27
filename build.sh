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
out/target/product/munch
)

rm -rf "${remove[@]}"

# Deivce Trees
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch device/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common device/xiaomi/sm8250-common

# Vendor Trees
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_munch vendor/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common

# Munch Firmware
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone https://github.com/PocoF4Trees/kernel_xiaomi_sm8250 -b staging-noksu kernel/xiaomi/sm8250

# Hardware Xiaomi
git clone https://github.com/Olzhas-Kdyr/android_hardware_xiaomi.git hardware/xiaomi

# MIUI Camera
git clone https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# devicesettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings.git packages/resources/devicesettings

# My Keys
git clone https://github.com/Olzhas-Kdyr/keys.git vendor/lineage-priv/keys

# Building 
. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
export SKIP_ABI_CHECKS=true
lunch lineage_munch-bp2a-userdebug
make installclean
m bacon

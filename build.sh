rm -rf .repo/local_manifests

# repo init
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs

# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
device/xiaomi
kernel/xiaomi
vendor/xiaomi
hardware/xiaomi
hardware/dolby
packages/resources/devicesettings
packages/apps/ViPER4AndroidFX
)

rm -rf "${remove[@]}"

# Deivce Tree
git clone --depth=1 https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch -b LunarisAOSP-16 device/xiaomi/munch
git clone --depth=1 https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common -b LunarisAOSP-16 device/xiaomi/sm8250-common

# Vendor Tree
git clone --depth=1 https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_munch vendor/xiaomi/munch
git clone --depth=1 https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common

# Munch FW
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone --depth=1 https://github.com/SenseiiX/fusionX_sm8250.git kernel/xiaomi/sm8250

# Hardware Xiaomi
git clone --depth=1 https://github.com/RisingOS-Revived-devices/android_hardware_xiaomi hardware/xiaomi

# DeviceSettings
git clone --depth=1 https://github.com/PocoF4Trees/packages_resources_devicesettings packages/resources/devicesettings

# MIUI Camera
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# ViPER4AndroidFX
git clone https://github.com/PocoF4Trees/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

cd kernel/xiaomi/sm8250
bash nextpatch.sh
rm -rf KernelSU-Next/userspace/su
cd ../../..

. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
lunch lineage_munch-bp2a-user
m lunaris

#cd out/target/product && rm -rf gapps && mv munch gapps && cd ../../..
#cd device/xiaomi/munch && rm -rf lineage_munch.mk && mv vanilla.txt lineage_munch.mk && cd ../../..

#. build/envsetup.sh
#export BUILD_USERNAME=olzhas
#export BUILD_HOSTNAME=ubuntu
#lunch lineage_munch-bp1a-user
#mka bacon

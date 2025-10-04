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
git clone --depth=1 https://github.com/PocoF4Trees/device_xiaomi_munch.git device/xiaomi/munch
#git clone --depth=1 https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common device/xiaomi/sm8250-common

# Vendor Tree
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_munch.git vendor/xiaomi/munch
#git clone --depth=1 https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common

# Munch FW
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone --depth=1 https://github.com/SenseiiX/fusionX_sm8250.git -b wip-next kernel/xiaomi/munch

# Hardware Xiaomi
git clone https://github.com/Project-SenX/android_hardware_xiaomi hardware/xiaomi

# DeviceSettings
git clone https://github.com/PocoF4Trees/packages_resources_devicesettings packages/resources/devicesettings

# MIUI Camera
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# Hardware Dolby Atmos
git clone --depth=1 https://github.com/PocoF4Trees/hardware_dolby hardware/dolby

# ViPER4AndroidFX
#git clone https://github.com/PocoF4Trees/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu

cd kernel/xiaomi/munch
bash nextpatch.sh
rm -rf KernelSU-Next/userspace/su
cd ../../..

lunch lineage_munch-bp2a-user
m lunaris

cd out/target/product && rm -rf gapps && mv munch gapps && cd ../../..
cd device/xiaomi/munch && rm -rf lineage_munch.mk && mv vanilla.txt lineage_munch.mk && cd ../../..

. build/envsetup.sh

cd kernel/xiaomi/munch
bash nextpatch.sh
rm -rf KernelSU-Next/userspace/su
cd ../../..

export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
lunch lineage_munch-bp2a-user
m lunaris

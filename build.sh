rm -rf .repo/local_manifests

# repo init
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs
#repo init --git-lfs --no-clone-bundle -u https://git@github.com/LineageOS/android.git -b refs/changes/42/436442/31

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
git clone --depth=1 https://github.com/PocoF4Trees/device_xiaomi_munch -b LunarisAOSP device/xiaomi/munch

# Vendor Tree
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_munch vendor/xiaomi/munch

# Munch FW
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone --depth=1 https://github.com/Olzhas-Kdyr/kernel_xiaomi_sm8250.git -b munch kernel/xiaomi/munch

# Hardware Xiaomi
git clone --depth=1 https://github.com/Olzhas-Kdyr/hardware_xiaomi hardware/xiaomi

# Hardware Dolby
git clone --depth=1 https://github.com/PocoF4Trees/hardware_dolby hardware/dolby

# DeviceSettings
git clone --depth=1 https://github.com/PocoF4Trees/packages_resources_devicesettings packages/resources/devicesettings

# MIUI Camera
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# Build
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
#lunch lineage_munch-bp2a-user
# lunaris

rm -rf .repo/local_manifests

# repo init

#repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs
#repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs
#repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs
#repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs
#repo init -u https://github.com/yaap/manifest.git -b sixteen --git-lfs
#repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs
#repo init -u https://github.com/crdroidx/android.git -b 16.0 --git-lfs --no-clone-bundle

# repo sync script
rm -rf system/core
rm -rf hardware/lineage/compat
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
git clone https://github.com/PocoF4Trees/device_xiaomi_munch -b Lunaris device/xiaomi/munch

# Vendor Tree
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch -b 16 vendor/xiaomi/munch

# Munch FW
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
#git clone https://github.com/PocoF4Trees/kernel_xiaomi_munch -b yaap-munch kernel/xiaomi/munch
git clone https://github.com/SenseiiX/fusionX_sm8250.git -b stable-susfs kernel/xiaomi/munch

# Hardware Xiaomi
git clone https://github.com/PocoF4Trees/hardware_xiaomi -b 16 hardware/xiaomi

# Hardware Dolby Atmos
git clone https://github.com/PocoF4Trees/hardware_dolby hardware/dolby

# DeviceSettings
git clone https://github.com/PocoF4Trees/packages_resources_devicesettings packages/resources/devicesettings

# MIUI Camera
git clone https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# ViPER4AndroidFX
git clone https://github.com/PocoF4Trees/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

# Build
. build/envsetup.sh
lunch lineage_munch-bp2a-user
mka bacon

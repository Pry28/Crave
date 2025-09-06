rm -rf .repo/local_manifests

# repo init
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault

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
git clone https://github.com/PocoF4Trees/device_xiaomi_munch device/xiaomi/munch

# Vendor Tree
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch vendor/xiaomi/munch

# Munch FW
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone https://github.com/Olzhas-Kdyr/kernel_xiaomi_sm8250 kernel/xiaomi/munch

# Hardware Xiaomi
git clone https://github.com/PocoF4Trees/hardware_xiaomi hardware/xiaomi

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
lunch infinity_munch-user
m bacon

cd out/target/product && rm -rf gapps && mv munch gapps && cd ../../..
cd device/xiaomi/munch && rm -rf infinity_munch.mk && mv vanilla.txt infinity_munch.mk && cd ../../..

. build/envsetup.sh
lunch infinity_munch-user
m bacon

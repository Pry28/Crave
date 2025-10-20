rm -rf .repo/local_manifests

# repo init
#repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs
#repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
repo init -u https://github.com/yaap/manifest.git -b sixteen --git-lfs

# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
device/xiaomi
kernel/xiaomi
vendor/xiaomi
hardware/xiaomi
packages/resources/devicesettings
packages/apps/ViPER4AndroidFX
)

rm -rf "${remove[@]}"

# Deivce Tree
git clone --depth=1 https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch -b yaap device/xiaomi/munch
git clone --depth=1 https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common -b yaap device/xiaomi/sm8250-common

# Vendor Tree
git clone --depth=1 https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_munch vendor/xiaomi/munch
git clone --depth=1 https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common

# Munch FW
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone --depth=1 -b staging-noksu kernel/xiaomi/sm8250

# Hardware Xiaomi
git clone https://github.com/Project-SenX/android_hardware_xiaomi hardware/xiaomi

# DeviceSettings
git clone https://github.com/PocoF4Trees/packages_resources_devicesettings packages/resources/devicesettings

# MIUI Camera
git clone --depth=1 https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# ViPER4AndroidFX
git clone https://github.com/PocoF4Trees/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

# Signing
#git clone https://github.com/ProjectInfinity-X/vendor_infinity-priv_keys-template vendor/infinity-priv/keys
#cd vendor/infinity-priv/keys
#./keys.sh
#cd ../../..

# Building 
. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
# Building: Cloning KSU Next
#cd kernel/xiaomi/sm8250
#git submodule update --init
#rm -rf KernelSU-Next/userspace/su
#cd ../../..

lunch yaap_munch-eng
m yaap

# Building: Build Vanilla
#cd out/target/product && rm -rf gapps && mv munch gapps && cd ../../..
#cd device/xiaomi/munch && rm -rf infinity_munch.mk && mv vanilla.txt infinity_munch.mk && cd ../../..

#. build/envsetup.sh

#export BUILD_USERNAME=olzhas
#export BUILD_HOSTNAME=ubuntu
#lunch infinity_munch-user
#m bacon

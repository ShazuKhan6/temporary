# sync rom 1
#trigger build
repo init -u https://github.com/StagOS/manifest.git -b r11
 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/GangsterPlayz1/local_manifests.git --depth 1 -b aex .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom 1
source build/envsetup.sh
lunch corvus_RMX1801-userdebug
mka bacon

# upload rom
rclone copy out/target/product/RMX1801/corvus*.zip cirrus:RMX1801 -P

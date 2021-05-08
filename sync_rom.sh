#!/bin/bash

set -exv

# sync rom
repo init -u https://github.com/PixelExperience/manifest -b eleven-plus --depth=1

git clone https://github.com/DhruvChhura/mainfest_personal.git --depth=1 -b pe .repo/local_manifests

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

rm -rf vendor/codeaurora/telephony hardware/qcom-caf/msm8996/media hardware/qcom-caf/msm8996/audio hardware/qcom-caf/msm8996/display && git clone https://github.com/wave-project/vendor_codeaurora_telephony --depth=1 --single-branch vendor/codeaurora/telephony/ && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_media hardware/qcom-caf/msm8996/media && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_display hardware/qcom-caf/msm8996/display &&  git clone https://github.com/LineageOS/android_hardware_qcom_audio --single-branch -b lineage-18.1-caf-msm8996 hardware/qcom-caf/msm8996/audio && rm -rf hardware/qcom-caf/msm8996/display && git clone --depth=1 https://github.com/DhruvChhura/hardware_qcom-caf_msm8996_display.git hardware/qcom-caf/msm8996/display


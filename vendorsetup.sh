#
# Copyright (C) 2023 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

FDEVICE="chagalllte"
add_lunch_combo omni_chagalllte-eng

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
	if [ -n "$chkdev" ]; then
		FOX_BUILD_DEVICE="$FDEVICE"
	else
		chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
		[ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
	fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true

	export OF_USE_GREEN_LED=0
	export FOX_USE_NANO_EDITOR=1
	export FOX_ENABLE_APP_MANAGER=1
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;"
	export OF_PATCH_AVB20=1
	export FOX_DELETE_AROMAFM=1

	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=0
	export OF_NO_MIUI_PATCH_WARNING=1

	export FOX_MAINTAINER_PATCH_VERSION="0"
	export OF_MAINTAINER="MrGadget84"

	export OF_SCREEN_H=2560
	export OF_STATUS_H=60
	export OF_STATUS_INDENT_LEFT=20
	export OF_STATUS_INDENT_RIGHT=20
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=1

	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/dw_mmc.0/by-name/RECOVERY"
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/platform/dw_mmc.0/by-name/BOOT"

	export FOX_TARGET_DEVICES="chagalllte,SM-T805,chagall"
	export TARGET_DEVICE_ALT="SM-T805,chagall"

	export OF_DISABLE_SAMSUNG_RECOVERY_ROLLER=1
	export FOX_PREVENT_SAMSUNG_OVERWRITE=1

	function download_magisk(){
		local DEST=$1
		if [ -n "${DEST}" ]; then
			if [ ! -e ${DEST} ]; then
				echo "Downloading the Latest Release of Magisk..."
				local LATEST_MAGISK_URL=$(curl -sL https://api.github.com/repos/topjohnwu/Magisk/releases/latest | grep browser_download_url | grep Magisk- | cut -d : -f 2,3 | tr -d '"')
				mkdir -p $(dirname ${DEST})
				wget -q ${LATEST_MAGISK_URL} -O ${DEST} || wget ${LATEST_MAGISK_URL} -O ${DEST}
				local RCODE=$?
				if [ "$RCODE" = "0" ]; then
					echo "Successfully Downloaded Magisk to ${DEST}!"
					echo "Done!"
				else
					echo "Failed to Download Magisk to ${DEST}!"
				fi
			fi
		fi
	}
	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk.zip
	download_magisk $FOX_USE_SPECIFIC_MAGISK_ZIP

	export OF_SPLASH_MAX_SIZE=130

	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi

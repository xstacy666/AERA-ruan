#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024-2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# Screen settings. Garnet is 1220x2712; AERA renders against the adaptive
# 2400-high canvas and scales it to the physical display.
AERA_MAINTAINER := Community starter tree (verify on device)
AERA_UI2_ADAPTIVE_RESOLUTION := true
AERA_SCREEN_H := 2560
AERA_STATUS_H := 115
AERA_HIDE_NOTCH := 1
AERA_CLOCK_POS := 1
AERA_STATUS_INDENT_LEFT := 56
AERA_STATUS_INDENT_RIGHT := 48
AERA_ALLOW_DISABLE_NAVBAR := 0
AERA_USE_GREEN_LED := 0

# other stuff
AERA_QUICK_BACKUP_LIST := /boot;/data;
AERA_ENABLE_LPTOOLS := 1
AERA_NO_TREBLE_COMPATIBILITY_CHECK := 1
AERA_DYNAMIC_FULL_SIZE := 9126805504

# number of list options before scrollbar creation
AERA_OPTIONS_LIST_NUM := 11

# A/B with recovery partition
AERA_AB_DEVICE_WITH_RECOVERY_PARTITION := 1

# ----- data format stuff -----
# ensure that /sdcard is bind-unmounted before f2fs data repair or format
AERA_UNBIND_SDCARD_F2FS := 1

# automatically wipe /metadata after data format
AERA_WIPE_METADATA_AFTER_DATAFORMAT := 1

# avoid MTP issues after data format
AERA_BIND_MOUNT_SDCARD_ON_FORMAT := 1

# Unmount emulated storage cleanly before rebooting or formatting.
AERA_UNMOUNT_SDCARDS_BEFORE_REBOOT := 1

# don't spam the console with loop errors
AERA_LOOP_DEVICE_ERRORS_TO_LOG := 1

# lz4 compression
AERA_USE_LZ4_COMPRESSION := 1

# build all the partition tools
AERA_ENABLE_ALL_PARTITION_TOOLS := 1

# enable the FRP addon
AERA_ENABLE_FRP_WIPE := 1

# dmctl
AERA_USE_DMCTL := 1

# Garnet ships a prebuilt kernel and f2fs/casefolded userdata.
AERA_FORCE_PREBUILT_KERNEL := 1
AERA_FORCE_DATA_FORMAT_F2FS := 1
AERA_FORCE_CASEFOLDING := 1
AERA_DISABLE_ORS_AUTO_REBOOT := 1
AERA_USE_LOCKSCREEN_BUTTON := 1
AERA_ENABLE_WLAN := 1
#


# ---------------- ruan-specific AERA settings (verify on device) ---------------
AERA_NO_HAPTICS := true
AERA_NO_SCREEN_BLANK := true
AERA_DEFAULT_BRIGHTNESS := 1600
AERA_MAX_BRIGHTNESS := 4095
AERA_USE_LEGACY_BATTERY_SERVICES := true
AERA_LOAD_VENDOR_MODULES := "nt36532_spi.ko xiaomi_touch.ko lct_tp.ko panel_event_notifier.ko qti_battery_charger_main.ko lc_auth_battery.ko leds-qpnp-vibrator-ldo.ko adsp_loader_dlkm.ko"
AERA_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

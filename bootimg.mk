LOCAL_PATH := $(call my-dir)
RECOVERY_TAR := $(PRODUCT_OUT)/recovery.tar
$(recovery_ramdisk): $(recovery_uncompressed_ramdisk_target)
	$(call pretty,"Target LZMA ramdisk: $@")
	$(hide) xz --format=lzma --lzma1=dict=16MiB -9 -c < $(recovery_uncompressed_ramdisk_target) > $@
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_kernel) $(recovery_ramdisk)
	@echo -e "----- Making recovery image -----"
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo -e "Made recovery image: $@"
	@echo -e "----- Adding SEAndroid enforce tag for Samsung bootloader -----"
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	$(hide) tar -C $(PRODUCT_OUT) -H ustar -c recovery.img > $(RECOVERY_TAR)
	@echo -e "Made Odin flashable recovery tar: $(RECOVERY_TAR)"

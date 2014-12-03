ifeq (HUAWEI,$(PRODUCT_MANUFACTURER))
  ifeq ($(TARGET_BOARD_PLATFORM), msm7x27)
    include $(call all-makefiles-under,$(call my-dir))
  endif
endif

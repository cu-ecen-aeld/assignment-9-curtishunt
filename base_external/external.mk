#includes make file in aesd assignments
include $(HOME)/assignment-4-curtishunt/base_external/package/aesd-assignments/aesd-assignments.mk

#includes all make files in packages
#include $(sort $(wildcard $(BR2_EXTERNAL_PROJECT_BASE_PATH)/package/*/*.mk))

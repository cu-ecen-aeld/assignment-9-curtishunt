#includes make file in aesd assignments
include $BR2_EXTERNAL_project_base_PATH/package/aesd-assignments/aesd-assignments.mk
#includes all make files in packages
#include $(sort $(wildcard $(BR2_EXTERNAL_PROJECT_BASE_PATH)/package/*/*.mk))

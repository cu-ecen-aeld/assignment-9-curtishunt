
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 5fd6e2aeda6d2bbdc1e3d4a8ce7a3cd566c51965
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-curtishunt.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	# $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) ARCH=arm64 CROSS_COMPILE=$(TARGET_CROSS) -C $(LINUX_DIR) M=$(@D)/server all
	# build kernel driver module
	$(MAKE) ARCH=arm64 CROSS_COMPILE=$(TARGET_CROSS) -C $(LINUX_DIR) M=$(@D)/aesd-char-driver modules

endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# $(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	# $(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	# $(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	# $(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/etc/finder-app
	# $(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/etc/finder-app
	# $(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/etc/finder-app
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -D -m 0644 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/usr/bin
	#$(INSTALL) -m 0755 $(@D)/aesd-char-driver/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment9/* $(TARGET_DIR)/bin
endef

AESD_ASSIGNMENTS_FINALIZE_HOOKS += AESD_ASSIGNMENTS_RUN_DEPMOD

define AESD_ASSIGNMENTS_RUN_DEPMOD
	$(HOST_DIR)/bin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
endef


$(eval $(generic-package))


##############################################################
#
# LDD
#
##############################################################

#TODO: Assignment 7 git repo contents:
LDD_VERSION = 5c3cae6ddc96b8645dfa6f6bc4ddbba08aae8789
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-curtishunt.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull all
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/
	$(INSTALL) -D -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)//lib/modules/
endef

$(eval $(generic-package))

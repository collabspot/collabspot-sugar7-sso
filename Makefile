MANIFEST_VERSION := $(shell grep "'version' => " manifest.php | cut -d' ' -f 5 | sed "s/'//g" | sed "s/,//g")
ZIP_FILE := collabspot-sugar7-sso-$(MANIFEST_VERSION).zip

zip:
	zip -r $(ZIP_FILE) LICENSE.txt manifest.php src
	@echo
	@echo "Review the contents:"
	@echo "=========="
	@unzip -c $(ZIP_FILE) src/custom/modules/Users/tpls/AuthenticateParent.tpl
	@echo "=========="
	@echo "Zipped to $(ZIP_FILE)"

zip_dev:
	cp manifest.php manifest.php.bak
	cp src/custom/modules/Users/tpls/AuthenticateParent.tpl src/custom/modules/Users/tpls/AuthenticateParent.tpl.bak
	# append '-dev' to version in manifest.php
	sed -i -E "s/'version' => '([0-9]+.[0-9]+.[0-9]+)',/'version' => '\1-dev',/g" manifest.php
	# append contents of extra_domains.txt to AuthenticateParent.tpl
	sed '/\/\/ Extras/r extra_domains.txt' < src/custom/modules/Users/tpls/AuthenticateParent.tpl > AuthenticateParent.tpl.tmp
	mv AuthenticateParent.tpl.tmp src/custom/modules/Users/tpls/AuthenticateParent.tpl
	zip -r collabspot-sugar7-sso-$(MANIFEST_VERSION)-dev.zip LICENSE.txt manifest.php src/custom/modules/Users/tpls/AuthenticateParent.tpl
	# revert files
	mv manifest.php.bak manifest.php
	mv src/custom/modules/Users/tpls/AuthenticateParent.tpl.bak src/custom/modules/Users/tpls/AuthenticateParent.tpl
	@echo "Review the contents:"
	@echo "=========="
	@unzip -c collabspot-sugar7-sso-$(MANIFEST_VERSION)-dev.zip src/custom/modules/Users/tpls/AuthenticateParent.tpl
	@echo "=========="
	@echo "Zipped to collabspot-sugar7-sso-$(MANIFEST_VERSION)-dev.zip"

help:
	@echo "zip - (default) generate zip file"
	@echo "zip_dev - generate zip file for development appending extra_domains.txt"

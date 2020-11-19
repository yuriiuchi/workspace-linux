install:
	cd wms-environment/portinari && make clone && mv SL-WMSPO SL-WMSPO-Learn
	cd wms-environment/portinari && make clone
	cd wms-environment/java/running && make GitCloneWms
	cd wms-environment/java/dev-001 && make GitCloneWms
	cd wms-environment/java/dev-002 && make GitCloneWms
	cd wms-environment/mobile && make cloneMobile && mv SL-WMSMobile SL-WMSMobile-Learn
	cd wms-environment/mobile && make cloneMobile
	#rm -R .git

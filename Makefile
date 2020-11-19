install:
	make installUtils
	ssh-keygen -t rsa -b 4096 -C "yuri.iuchi@totvs.com.br"
	google-chrome -b https://totvstfs.visualstudio.com/_usersSettings/keys
	cd wms-environment/portinari && make clone && mv SL-WMSPO SL-WMSPO-Learn
	cd wms-environment/portinari && make clone
	cd wms-environment/java/running && make GitCloneWms
	cd wms-environment/java/dev-001 && make GitCloneWms
	cd wms-environment/java/dev-002 && make GitCloneWms
	cd wms-environment/mobile && make cloneMobile && mv SL-WMSMobile SL-WMSMobile-Learn
	cd wms-environment/mobile && make cloneMobile
	#rm -R .git

installUtils:
	sudo apt-get install gedit -y
	sudo apt-get install curl -y
	sudo apt-get install vim -y
	sudo apt-get install git -y
	sudo apt-get install zsh -y
	sudo apt-get install krdc -y
	make InstallCtop
	make InstallSdkMan
	make InstallGit
	make InstallVsCode
	make InstallSpring
	make InstallDocker
	make InstallAndroidStudio
	sudo apt-get install nodejs -y
	sudo apt-get install npm 
	nvm install 12.13.1
	sudo apt-get install remmina -y
	sudo apt-get install remmina remmina-plugin-* libfreerdp-plugins-standard -y
	make InstallLombok
	make InstallLightworks
	make OpenTutorials
	make InstallAtom
	
InstallCtop:
	sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop
	sudo chmod +x /usr/local/bin/ctop

InstallSdkMan:
	curl -s "https://get.sdkman.io" | bash
	source "$$HOME/.sdkman/bin/sdkman-init.sh"
	sdk version
	sdk install java
	sdk install maven
	sdk install gradle
	sdk install ant
	
InstallGit:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

InstallEclipse:
	wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz&mirror_id=576 -O Eclipse.tar.gz
	
InstallVsCode:
	wget https://az764295.vo.msecnd.net/stable/8795a9889db74563ddd43eb0a897a2384129a619/code_1.40.1-1573664190_amd64.deb -O VSCode.deb
	sudo dpkg -i VSCode.deb

InstallSpring:
	wget https://download.springsource.com/release/STS4/4.4.2.RELEASE/dist/e4.13/spring-tool-suite-4-4.4.2.RELEASE-e4.13.0-linux.gtk.x86_64.tar.gz -O SpringTools.tar.gz
	tar -vzxf SpringTools.tar.gz
	cp -r sts-4.4.2.RELEASE ../spring-tools
	sudo apt-get install snapd snapd-xdg-open
	sudo snap install --classic vscode
	sudo snap remove vscode

InstallDocker:
	sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
	sudo usermod -aG docker yuri
	sudo apt-get install docker-compose

InstallAndroidStudio:
	wget https://dl.google.com/dl/android/studio/ide-zips/3.5.2.0/android-studio-ide-191.5977832-linux.tar.gz -O android.tar.gz
	tar -vzxf android.tar.gz
	cp -r android-studio ../android-studio
	cd ../android-studio/bin && sh studio.sh && sudo chown yuri:yuri /dev/kvm
	sudo apt install qemu-kvm 
	sudo adduser yuri kvm
	sudo chown yuri /dev/kvm 

InstallLombok:
	wget https://projectlombok.org/downloads/lombok.jar 
	java -jar lombok.jar

InstallLightworks:
	wget https://cdn.lwks.com/lightworks-14.5.0-amd64.deb
	sudo apt-get install -f
	sudo dpkg -i lightworks-14.5.0-amd64.deb

InstallAtom:
	wget https://atom.io/download/deb
	sudo dpkg -i atom-amd64.deb

OpenTutorials:
	google-chrome -b https://ohmyz.sh/
	google-chrome -b https://github.com/bcicen/ctop
	google-chrome -b https://sdkman.io/install
	google-chrome -b https://github.com/nvm-sh/nvm
	ggogle-chrome https://vpn3.totvs.com.br

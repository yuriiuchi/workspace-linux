AtualizarCompilarSubirWms:
	make AtualizarWms
	make CompilarWms
	make SubirWms

ClonarCompilarSubirWms:
	make GitCloneWmsSuite
	make CompilarWms
	make SubirWms

CompilarWms:
	make CompileDocumento
	#make CompileFoundationPO
	make CompileUnidade
	make CompileWms

AtualizarWms:
	make GitPullDocumento
	make GitPullFoundationPO
	make GitPullUnidade
	make GitPullWms
	make GitPullWes

SubirWms:
	make DockerStartWms
	make UpServiceDocumento
	make UpServiceFoundationPO
	make UpServiceUnidade
	make UpServiceWms

DockerStartWms: 
	docker start b03520eeb6ee
	docker start e2c4117d283f
	docker start e5fdab3b33e7
	docker start 1f5fa4896334

PararWms:
	kill $$(jps | grep RELEASE | awk '{print $$1}')

PararApp:
	kill $$(jps | grep wms-recebimento-1.0.0 | awk '{print $$1}')

GitCloneWmsSuite:
	make GitCloneDocumento
	make GitCloneFoundationPO
	make GitCloneUnidade
	make GitCloneWms
	make GitCloneWes
	make GitCloneComunicacao

DockerClearRestart:
	sudo docker container stop $$(sudo docker container ls -aq)
	sudo docker container rm $$(sudo docker container ls -aq)
	sudo docker volume rm $$(sudo docker volume ls -q -f dangling=true)
	sudo docker-compose up -d
	
GitPullDocumento:
	cd SL-Documento && git pull
	cd SL-DocumentoQuery && git pull
	
GitPullFoundationPO:
	cd SL-FoundationPO && git pull
	
GitPullUnidade:
	cd SL-Unidade && git pull
	cd SL-UnidadeQuery && git pull
	
GitPullWms:
	cd SL-WMSConferenciaRecebimento && git pull
	cd SL-WMSEndereco && git pull
	cd SL-WMSEstoque && git pull
	cd SL-WMSExpedicao && git pull
	cd SL-WMSRecebimento && git pull
	cd SL-WMSSelecaoEstoque && git pull
	cd SL-WESCore && git pull
	cd SL-ComunicacaoCore && git pull
	cd SL-ComunicacaoReceiver && git pull
	cd SL-ComunicacaoThf && git pull
	cd SL-WMSQuery && git pull
	cd SL-WESQuery && git pull
	cd SL-WMSInventario && git pull


GitPullWes:
	cd SL-WESCore && git pull
	cd SL-WESQuery && git pull
	

#GitPullSL:
#	cd SL-Front && git pull

GitComunicacaoSL:
	cd SL-ComunicacaoCore && git pull
	cd SL-ComunicacaoReceiver && git pull
	cd SL-ComunicacaoThf && git pull

CompileDocumento:
	cd SL-Documento && mvn clean install -DskipTests
	cd SL-DocumentoQuery && mvn clean install -DskipTests
	
CompileFoundationPO:
	cd SL-FoundationPO && mvn clean install -DskipTests
	
CompileUnidade:
	cd SL-Unidade && mvn clean install -DskipTests
	cd SL-UnidadeQuery && mvn clean install -DskipTests
	
CompileWms:
	cd SL-WMSConferenciaRecebimento && mvn clean install -DskipTests
	cd SL-WMSEndereco && mvn clean install -DskipTests
	cd SL-WMSEstoque && mvn clean install -DskipTests
	cd SL-WMSExpedicao && mvn clean install -DskipTests
	cd SL-WMSRecebimento && mvn clean install -DskipTests
	cd SL-WMSSelecaoEstoque && mvn clean install -DskipTests
	cd SL-WMSQuery && mvn clean install -DskipTests
	cd SL-WESCore && mvn clean install -DskipTests
	cd SL-WESQuery && mvn clean install -DskipTests
	cd SL-WMSInventario && mvn clean install -DskipTests


UpServiceWms:
	cd SL-WMSConferenciaRecebimento/target/  && java -jar -Dspring.profiles.active=dev wms-conferencia-recebimento-1.0.0-RELEASE.jar&
	cd SL-WMSEndereco/target/  && java -jar -Dspring.profiles.active=dev wms-endereco-1.0.0-RELEASE.jar&
	cd SL-WMSEstoque/target/  && java -jar  -Dspring.profiles.active=dev wms-estoque-1.0.0-RELEASE.jar&
	cd SL-WMSExpedicao/target/  && java -jar  -Dspring.profiles.active=dev wms-expedicao-1.0.0-RELEASE.jar&
	cd SL-WMSRecebimento/target/  && java -jar  -Dspring.profiles.active=dev wms-recebimento-1.0.0-RELEASE.jar&
	cd SL-WMSSelecaoEstoque/target/  && java -jar  -Dspring.profiles.active=dev wms-selecao-estoque-1.0.0-RELEASE.jar&
	cd SL-WMSQuery/target/  && java -jar  -Dspring.profiles.active=dev wms-query-1.0.0-RELEASE.jar&
	cd SL-WESCore/target/  && java -jar  -Dspring.profiles.active=dev wes-core-1.0.0-RELEASE.jar&
	cd SL-WESQuery/target/  && java -jar  -Dspring.profiles.active=dev wes-query-1.0.0-RELEASE.jar&
	cd SL-WMSInventario/target/  && java -jar  -Dspring.profiles.active=dev wms-inventario-1.0.0-RELEASE.jar&


UpServiceDocumento:
	cd SL-Documento/target/  && java -jar  -Dspring.profiles.active=dev documento-1.0.0-RELEASE.jar&
	cd SL-DocumentoQuery/target/  && java -jar  -Dspring.profiles.active=dev documento-query-1.0.0-RELEASE.jar&
	
UpServiceFoundationPO:
	cd SL-FoundationPO/target/  && java -jar  -Dspring.profiles.active=dev etiqueta-1.0.0-RELEASE.jar&
	
UpServiceUnidade:
	cd SL-Unidade/target/  && java -jar  -Dspring.profiles.active=dev unidade-1.0.0-RELEASE.jar&
	cd SL-UnidadeQuery/target/  && java -jar  -Dspring.profiles.active=dev unidade-query-1.0.0-RELEASE.jar&

GitCloneDocumento:
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-Documento
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-DocumentoQuery
	
GitCloneFoundationPO:
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-FoundationPO
		
GitCloneUnidade:
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-Unidade
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-UnidadeQuery
	
GitCloneWms:
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSConferenciaRecebimento
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSEndereco 
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSEstoque
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSExpedicao
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSRecebimento
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSSelecaoEstoque
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSQuery
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WMSInventario

GitCloneWes:
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WESCore
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-WESQuery

GitCloneComunicacao:
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-ComunicacaoCore
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-ComunicacaoReceiver
	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-ComunicacaoThf

#GitCloneSL:
#	git clone totvstfs@vs-ssh.visualstudio.com:v3/totvstfs/SuiteLogistica/SL-Front

mvnCleanUWms:
	cd SL-WMSConferenciaRecebimento && mvn -U clean install
	cd SL-WMSEndereco && mvn -U clean install
	cd SL-WMSEstoque && mvn -U clean install
	cd SL-WMSExpedicao && mvn -U clean install
	cd SL-WMSRecebimento && mvn -U clean install
	cd SL-WMSSelecaoEstoque && mvn -U clean install
	cd SL-WMSQuery && mvn -U clean install
	cd SL-WESQuery && mvn -U clean install


	

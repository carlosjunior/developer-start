echo ==============================
echo update ubuntu package 
echo ============================== 
sudo apt-get update && \

echo ==============================
echo install jdk
echo ==============================
sudo add-apt-repository ppa:webupd8team/java && \
sudo apt-get install oracle-java8-installer && \
sudo java -version && \

echo ==============================
echo install maven
echo ==============================
cd /opt/ wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
sudo tar -xvzf apache-maven-3.3.9-bin.tar.gz && \
sudo mv apache-maven-3.3.9 maven && \

echo ================================
echo Adicionado variável de ambiente
echo ================================
echo "export M2_HOME=/opt/maven" > /etc/profile.d/mavenenv.sh && \
echo "export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/mavenenv.sh && \

sudo chmod +x /etc/profile.d/mavenenv.sh && \
source /etc/profile.d/mavenenv.sh && \
sudo mvn --version && \

echo ==============================
echo install git
echo ==============================
sudo apt-get install git && \
git --version && \

echo ==============================
echo config git
echo ==============================
echo git name, example: Lord Voldemort
read gitName
git config --global user.name $gitName  && \
echo git email, example: lord.voldemort@fluig.com
read gitEmail
git config --global user.email $gitEmail  && \
git config --global core.precomposeunicode true  && \
git config --list && \

echo ==============================
echo git ssh key
echo ==============================
ssh-keygen -t rsa -C $gitEmail && \

echo ==============================
echo install docker
echo ==============================
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo apt-key fingerprint 0EBFCD88 && \
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable" && \
sudo apt-get update && \
sudo apt-get install docker-ce && \
sudo docker --version && \

echo ==============================
echo install docker-compose
echo ==============================
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
docker-compose --version && \

echo ==============================
echo install node
echo ==============================
sudo apt-get install nodejs && \

echo ==============================
echo install npm
echo ==============================
sudo apt-get install npm && \

echo ==============================
echo Done, restart your machine!
echo ==============================

echo ==============================
echo update ubuntu package 
echo ============================== 
apt-get update

echo ==============================
echo install jdk
echo ==============================
add-apt-repository ppa:webupd8team/java && \
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections && \
apt-get install -y oracle-java8-installer

echo ==============================
echo install maven
echo ==============================
cd /opt/ wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
tar -xvzf apache-maven-3.3.9-bin.tar.gz && \
mv apache-maven-3.3.9 maven

echo ================================
echo Adicionado variável de ambiente
echo ================================
echo "export M2_HOME=/opt/maven" > /etc/profile.d/mavenenv.sh && \
echo "export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/mavenenv.sh && \
chmod +x /etc/profile.d/mavenenv.sh


echo ==============================
echo install git
echo ==============================
apt-get install -y git

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
git config --list

echo ==============================
echo git ssh key
echo ==============================
ssh-keygen -t rsa -C $gitEmail

echo ==============================
echo install docker
echo ==============================
apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
apt-key fingerprint 0EBFCD88 && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable" && \
apt-get update && \
apt-get install -y docker-ce

echo ==============================
echo install docker-compose
echo ==============================
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

echo ==============================
echo install node
echo ==============================
apt-get install -y nodejs

echo ==============================
echo install npm
echo ==============================
apt-get install -y npm

echo ==============================
echo Done, restart your machine!
echo ==============================

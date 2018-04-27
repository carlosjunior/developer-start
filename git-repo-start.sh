echo ==============================
echo Criando diretórios
echo ============================== 

mkdir ~/development/fluig
cd "~/development/fluig"
mkdir core
mkdir onpremise

chmod +x ~/development

echo ==============================
echo Clonando repositórios
echo ============================== 

cd "~/development/fluig/core"
git clone ssh://git@git.fluig.com:7999/fp/fluig.git

cd "~/development/fluig/"
git clone ssh://git@git.fluig.com:7999/lms/lms.git

cd "~development/fluig/onpremise"
git clone ssh://git@git.fluig.com:7999/fluig/fluig.git
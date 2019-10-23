
apk add --no-cache gnupg bash
adduser -D hadoop


wget https://www.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz.asc
wget https://www.apache.org/dist/hadoop/common/KEYS
wget https://www.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz
gpg --import KEYS
gpg --verify hadoop-3.2.1.tar.gz.asc hadoop-3.2.1.tar.gz

tar -zxvf hadoop-3.2.1.tar.gz
ln -s hadoop hadoop-3.2.1
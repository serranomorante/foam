yum update
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install pandoc
yum install pandoc-citeproc
# yum install wget
# mkdir pandoc
# wget -qO- https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-linux-amd64.tar.gz | \
#    tar xvzf - --strip-components 1 -C ./pandoc
# export PATH="./pandoc/bin:$PATH"
echo "pandoc version -> $(pandoc --version)"
# echo "which pandoc -> $(which pandoc)"
# echo "pandoc path -> $PANDOC_PATH"
# echo "$(pwd)/pandoc/bin" > /etc/profile.d/pndc.sh
# chmod +x /etc/profile.d/pndc.sh
# . /etc/profile
# cat /etc/profile.d/pndc.sh
# echo "path --> $PATH"

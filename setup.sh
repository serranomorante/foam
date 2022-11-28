yum install wget
mkdir pandoc
wget -qO- https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-linux-amd64.tar.gz | \
   tar xvzf - --strip-components 1 -C ./pandoc
export PATH="./pandoc/bin:$PATH"
which pandoc

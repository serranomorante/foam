yum install wget
mkdir pandoc
wget -qO- https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-linux-amd64.tar.gz | \
   tar xvzf - --strip-components 1 -C ./pandoc
export PATH="./pandoc/bin:$PATH"
echo "which pandoc -> $(which pandoc)"
# echo 'pathmunge /vercel/path0/pandoc/bin' > /etc/profile.d/pndc.sh
# chmod +x /etc/profile.d/pndc.sh
# . /etc/profile

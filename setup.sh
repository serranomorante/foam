echo "Starting setup.sh..."

yum install wget
yum install build-dep ghc
wget https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-src.tar.xz
tar xf ghc-9.2.5-src.tar.xz

cd ghc-9.2.5
./boot && ./configure
hadrian/build -j
cd ..

# yum install -y which gmp-devel

wget https://downloads.haskell.org/~cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-x86_64-linux-deb10.tar.xz
tar xf cabal-install-3.8.1.0-x86_64-linux-deb10.tar.xz
ln -s cabal /usr/bin/cabal

cabal update
cabal install pandoc pandoc-citeproc

# pandoc filters
npm install --global mermaid-filter

echo "pandoc version -> $(pandoc --version)"

echo "### Starting setup.sh..."

yum update
yum -y install wget

# Install pandoc and pandoc-citeproc
wget https://copr-be.cloud.fedoraproject.org/results/petersen/pandoc/epel-7-x86_64/00976393-pandoc/pandoc-2.7.3-1.el7.x86_64.rpm
wget https://copr-be.cloud.fedoraproject.org/results/petersen/pandoc/epel-7-x86_64/00976393-pandoc/pandoc-citeproc-0.16.2-1.el7.x86_64.rpm
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum install pandoc-2.7.3-1.el7.x86_64.rpm
yum install pandoc-citeproc-0.16.2-1.el7.x86_64.rpm
yum install google-chrome-stable_current_x86_64.rpm

# pandoc filters
npm install --global mermaid-filter

# print syntax highlighting css to the console
# thanks! https://github.com/jgm/pandoc/issues/7860#issuecomment-1018696254
style=${1:-pygments}
tmp=
trap 'rm -f "$tmp"' EXIT
tmp=$(mktemp)
echo '$highlighting-css$' > "$tmp"
echo '`test`{.c}' | pandoc --highlight-style=$style --template=$tmp

echo "Which chrome -> $(which google-chrome)"
echo "### Done."

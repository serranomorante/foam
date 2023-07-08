# NEVER EXECUTE THIS FILE LOCALLY

echo "### Starting setup.sh..."

yum update
yum -y install wget

# Install pandoc, pandoc-citeproc and chrome
wget https://copr-be.cloud.fedoraproject.org/results/petersen/pandoc/epel-7-x86_64/00976393-pandoc/pandoc-2.7.3-1.el7.x86_64.rpm
wget https://copr-be.cloud.fedoraproject.org/results/petersen/pandoc/epel-7-x86_64/00976393-pandoc/pandoc-citeproc-0.16.2-1.el7.x86_64.rpm
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum install pandoc-2.7.3-1.el7.x86_64.rpm
yum install pandoc-citeproc-0.16.2-1.el7.x86_64.rpm
yum install google-chrome-stable_current_x86_64.rpm

# Install npm packages
npm install -g mermaid-filter foam-cli

# Fix code syntax highlighting not working
sed -i 's/\r$//g' ./extractcss.sh
chmod +x ./extractcss.sh
./extractcss.sh pygments > ./assets/css/pygments.css

# Fix spaces in generated URLs
sed -i 's/\r$//g' ./slugify.sh
chmod +x ./slugify.sh
find . -type f -name "*.md" -exec ./slugify.sh -i -d {} \;

# Update references
foam migrate

echo "### Done."

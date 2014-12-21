NPM_PACKAGES="$HOME/.local/npm"
mkdir -p $NPM_PACKAGES
echo "prefix = $NPM_PACKAGES" >> ~/.npmrc

# Setup Node packages
echo "Install necessary packages and tools for node"
for package in `cat nodejs_packages`; do
    npm install -g $package
done

#!/bin/bash -e

################################################################################
##  File:  install-azure-cli.sh
##  Desc:  Install Azure CLI (az)
################################################################################

# Download the installation script
curl -fsSL https://aka.ms/InstallAzureCLIDeb -o install-azure-cli.sh

# Modify the script as necessary
# Example: Changing the installation to a specific version of Azure CLI
sed -i 's/sudo apt-get install -y azure-cli/sudo apt-get install -y azure-cli=2.58.0/g' install-azure-cli.sh

# Make the script executable
chmod +x install-azure-cli.sh

# Execute the modified script
sudo ./install-azure-cli.sh

# Add to helper scripts (if still necessary)
echo "azure-cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt" >> $HELPER_SCRIPTS/apt-sources.txt

# Clean up if necessary
rm -f /etc/apt/sources.list.d/azure-cli.list
rm -f /etc/apt/sources.list.d/azure-cli.list.save

# Invoke any tests to confirm installation
invoke_tests "CLI.Tools" "Azure CLI"


#!/bin/bash -e

################################################################################
##  File:  install-azure-cli.sh
##  Desc:  Install Azure CLI (az)
################################################################################

# Download the installation script
curl -fsSL https://aka.ms/InstallAzureCLIDeb -o install-azure-cli-script.sh

# Modify the script as necessary
# Example: Changing the installation to a specific version of Azure CLI
sed -i 's/apt-get install -y azure-cli/apt-get install -y azure-cli=2.58.0-1~focal/g' install-azure-cli-script.sh

# Make the script executable
chmod +x install-azure-cli-script.sh

# Execute the modified script
sudo ./install-azure-cli-script.sh

# Add to helper scripts (if still necessary)
echo "azure-cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt" >> $HELPER_SCRIPTS/apt-sources.txt

# Clean up if necessary
rm -f /etc/apt/sources.list.d/azure-cli.list
rm -f /etc/apt/sources.list.d/azure-cli.list.save

# Invoke any tests to confirm installation
invoke_tests "CLI.Tools" "Azure CLI"


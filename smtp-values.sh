##
#!/bin/bash

# Set your variables
RESOURCE_GROUP="dev-rg"
ACS_NAME="jnrlabs-acs"

echo "🔍 Getting Azure Communication Services configuration..."
echo "=================================================="

# Get the communication service details
echo "📋 Communication Service Details:"
az communication show --name $ACS_NAME --resource-group $RESOURCE_GROUP --output table

echo ""
echo "🔑 Getting Access Keys and Connection Strings:"
ACS_KEYS=$(az communication list-key --name $ACS_NAME --resource-group $RESOURCE_GROUP)

# Extract values
PRIMARY_KEY=$(echo $ACS_KEYS | jq -r '.primaryKey')
PRIMARY_CONN_STRING=$(echo $ACS_KEYS | jq -r '.primaryConnectionString')
ENDPOINT=$(echo $PRIMARY_CONN_STRING | sed 's/.*endpoint=\([^;]*\).*/\1/')

echo "=================================================="
echo "📧 SMTP Configuration Values for Alertmanager:"
echo "=================================================="
echo "smtp_smarthost: 'smtp.azurecomm.net:587'"
echo "smtp_from: 'your-verified-sender@yourdomain.com'"
echo "smtp_auth_username: '$ACS_NAME'"
echo "smtp_auth_password: '$PRIMARY_KEY'"
echo "smtp_require_tls: true"
echo ""
echo "🌐 Endpoint URL: $ENDPOINT"
echo "🔑 Primary Key: $PRIMARY_KEY"
echo "=================================================="

name: Terraform Plan

on:
  push:
    branches:
      - main

permissions:
  id-token: write
  contents: read

jobs:
  terraform-plan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: latest

      - uses: azure/login@v1
        with:
          client-id: ${{ secrets.AZURE_CLIENT_ID }}
          tenant-id: ${{ secrets.AZURE_TENANT_ID }}
          subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}

      - name: Loop through each module and plan
        run: |
          for dir in terraform/_modules/*/; do
            echo "Running Terraform in $dir"
            cd "$dir"
            terraform init
            terraform validate
            terraform plan
            cd - > /dev/null
          done

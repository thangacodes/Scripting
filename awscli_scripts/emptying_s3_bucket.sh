#!/bin/bash
echo "The script was executed at:" $(date '+ %d-%m-%Y %H:%M:%S')
bucket_name="evidence-identity-secops-2025"
profile_name="vault_admin"
aws s3 rm s3://${bucket_name} --recursive --profile ${profile_name}
aws s3 rb s3://${bucket_name} --force --profile $profile_name
exit 0

#!/bin/bash
echo "The script was executed at:" $(date '+ %d-%m-%Y %H:%M:%S')
## Variables
file_name="evidence_identity_alert_s3.py"
zip_name="evidence_identity.zip"
working_dir=$(pwd)
echo "Script will zip the file '${file_name}' into a zip archive called '${zip_name}'"
sleep 2
echo "removing existing '${zip_name}' file from the path '${working_dir}'"
rm -rf lambda/${zip_name}
ls -lrt lambda
sleep 2
echo "Again making a '${zip_name}' file on the path: '${working_dir}' "
zip lambda/${zip_name} lambda/${file_name}
exit 0

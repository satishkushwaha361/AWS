#!/bin/sh

# bucket_name=$1
# aws_key=$2
# aws_access_key=$3
# aws_access_secret=$4
# local_path=$5

# # Remove any existing versions of a ZIP
# rm -rf $local_path

# # Create a zip of the current directory.
# # zip -r $local_path . -x .git/ .git/*** .github/workflows/release.yml scripts/pipeline/release.sh scripts/pipeline/upload_file_to_s3.py .DS_Store
# #zip -r $local_path . .DS_Store
# # zip -r $local_path *.py .DS_Store

# # Install required dependencies for Python script.
# pip3 install boto3

# # Run upload script
# python3 scripts/pipeline/upload_file_to_s3.py $bucket_name $aws_key $aws_access_key $aws_access_secret $local_path
# # $local_path


: ${AWS_REGION:=us-east-1}
: ${DOTNET_LAMBDA_PACKAGE_NAME:=scripts/hello_lambda.zip}
export PATH="$PATH:/root/.dotnet/tools"
# cd "${DOTNET_LAMBDA_WORKING_DIR:-.}"
# dotnet lambda package $DOTNET_LAMBDA_PACKAGE_NAME
aws s3 cp --only-show-errors $DOTNET_LAMBDA_PACKAGE_NAME s3://s3snslmbdademo/
# aws lambda update-function-code \
#   --region $AWS_REGION \
#   --function-name $DOTNET_LAMBDA_FUNCTION_NAME \
#   --zip-file fileb://$DOTNET_LAMBDA_PACKAGE_NAME
# dotnet lambda deploy-function \
#   --region $AWS_REGION \
#   --function-name $DOTNET_LAMBDA_FUNCTION_NAME \
#   --function-handler $DOTNET_LAMBDA_FUNCTION_HANDLER \
#   --package $DOTNET_LAMBDA_PACKAGE_NAME
exit
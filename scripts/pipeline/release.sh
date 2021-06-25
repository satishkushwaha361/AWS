#!/bin/sh
: ${AWS_REGION:=us-east-1}
: ${DOTNET_LAMBDA_PACKAGE_NAME:=scripts/lambda_lambda.zip}
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
#!/bin/bash

mkdir -p build
cp -P src/* build
cd build
rm -f ../sct.zip
zip -r ../sct.zip ./*
cd ..


# aws lambda create-function \
#     --role=arn:aws:iam::464151344951:role/lambda-vpc \
#     --handler=handler.lambda-handler \
#     --profile=rise \
#     --region=us-west-2 \
#     --function-name=syscalltest \
#     --runtime=python3.6 \
#     --zip-file=fileb://sct.zip


aws lambda update-function-code \
    --function-name=syscalltest \
    --profile=rise \
    --region=us-west-2 \
    --zip-file=fileb://sct.zip

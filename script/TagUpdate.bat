chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Update Tag API by using curl in window script
:: written by yeony kim
:: Lake가 모두 만들어진 상태에서 Lake의 TagSchema(Tag meta) 와 ValueSchema(Value)의 설정값을 모두 알고
:: sensor1과 sensor2가 tag로 등록된 것을 알고 있는 상태
:: 현재 Tag Schema에는 name column 밖에 존재하지 않아 columns 배열에 1개의 JSON 이 들어감

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: zTI-Drfk76e3adxwEoweqiOkupF8LN0V6QCq8nTXlrlDT2zDHx9Vz8nVX14_2y5IhWzydKv-CaMBuCM6UasX1myX19ki4dJr38NYd2k6juYf9"
set LAKE_ID=c5ehcdmcb0jc72ia6pug

set SRC_TAG_NAME=sensor1
set TAR_TAG_NAME=sensor10

set URL=https://%LAKE_ID%.machlake.com/lakes/tags
curl -k -X PUT %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"name\": \"%SRC_TAG_NAME%\", \"columns\": [{\"col_name\": \"name\", \"value\": \"%TAR_TAG_NAME%\"}]}"

:: Return Format
:: {"data":{"name":"sensor10"},"status":"success"}

set URL=https://%LAKE_ID%.machlake.com/lakes/tags
curl -k -X PUT %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"name\": \"%SRC_TAG_NAME%\", \"columns\": [{\"col_name\": \"name\", \"value\": \"%TAR_TAG_NAME%\"}]}"

:: Return Format / SRC_TAG_NAME이 존재 하지 않는 경우 예시
:: {"data":{"name":"sensor10"},"status":"success"}

set SRC_TAG_NAME=sensor10
set TAR_TAG_NAME=sensor1

set URL=https://%LAKE_ID%.machlake.com/lakes/tags
curl -k -X PUT %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"name\": \"%SRC_TAG_NAME%\", \"columns\": [{\"col_name\": \"name\", \"value\": \"%TAR_TAG_NAME%\"}]}"

:: Return Format
:: {"data":{"name":"sensor1"},"status":"success"}
# Text Encoding to UTF-8 in CMD
# Example For Delete Calculated Data for tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION
TAG_NAME=$YOUR_TAG_NAME

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/calculated

# ------------------------------------------------------------------------------------------------- #

# CASE - Delete Calculated Data

BASE_TIME="\"2021-01-06 18:00:00 000:000:000\""

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"base_time\": $BASE_TIME}"

# Return Format / not exist tag name in lake
# {"data":{},"status":"success"}

BASE_TIME="\"1609930800\""

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"base_time\": $BASE_TIME}"
# Return Format
# {"data":{},"status":"success"}

# ------------------------------------------------------------------------------------------------- #